Return-Path: <keyrings+bounces-267-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10849811923
	for <lists+keyrings@lfdr.de>; Wed, 13 Dec 2023 17:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79FC282E68
	for <lists+keyrings@lfdr.de>; Wed, 13 Dec 2023 16:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5E733CC7;
	Wed, 13 Dec 2023 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PD81Z9+H"
X-Original-To: keyrings@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD99083;
	Wed, 13 Dec 2023 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zh20bVNgEauOmKOMVTT+oQhslL42e63cd3mafc5QuMg=; b=PD81Z9+Hz5q5itQ3DmYt+lymtK
	rbAWH1HZLxLHUKVZEBh1CUDT1Gcq2raouKY3J6f0oeH7MF1Qf8jNPcX/QD3F1eFfA9LYtxKJd5XWM
	NYaKwqm3OkJb3wbVkc1KlSShBk3kmXX51ppvBALlC/6FF9RmPt7z14e8kNIq+p9OjLeoJ8incaTEl
	KOTQkgC3JC43xmofru4rI8AJ9KtlWAwIWUWqXJukMc/XBEEbnP2/cKKLw2+8MxRihfAv2AEGd9O8h
	qbjPKxgqUiDMxuGernieuindthAfSXsJbsHcHuxrI0NOKrda94Ap5leFuQ+F1PdOn+bvhlsLYOakq
	VQ/4sHXg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rDRzx-002B4P-Kt; Wed, 13 Dec 2023 16:22:13 +0000
Date: Wed, 13 Dec 2023 16:22:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: ebiederm@xmission.com, kernel@quicinc.com, quic_pkondeti@quicinc.com,
	keescook@chromium.or, viro@zeniv.linux.org.uk, brauner@kernel.org,
	oleg@redhat.com, dhowells@redhat.com, jarkko@kernel.org,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] kernel: Introduce a write lock/unlock wrapper for
 tasklist_lock
Message-ID: <ZXnaNSrtaWbS2ivU@casper.infradead.org>
References: <20231213101745.4526-1-quic_aiquny@quicinc.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213101745.4526-1-quic_aiquny@quicinc.com>

On Wed, Dec 13, 2023 at 06:17:45PM +0800, Maria Yu wrote:
> +static inline void write_lock_tasklist_lock(void)
> +{
> +	while (1) {
> +		local_irq_disable();
> +		if (write_trylock(&tasklist_lock))
> +			break;
> +		local_irq_enable();
> +		cpu_relax();

This is a bad implementation though.  You don't set the _QW_WAITING flag
so readers don't know that there's a pending writer.  Also, I've seen
cpu_relax() pessimise CPU behaviour; putting it into a low-power mode
that takes a while to wake up from.

I think the right way to fix this is to pass a boolean flag to
queued_write_lock_slowpath() to let it know whether it can re-enable
interrupts while checking whether _QW_WAITING is set.


