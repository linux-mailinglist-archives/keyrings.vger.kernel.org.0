Return-Path: <keyrings+bounces-18-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD68C7E2CC7
	for <lists+keyrings@lfdr.de>; Mon,  6 Nov 2023 20:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EDB8280AC3
	for <lists+keyrings@lfdr.de>; Mon,  6 Nov 2023 19:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10C2F41;
	Mon,  6 Nov 2023 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcePSch5"
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E762D051
	for <keyrings@vger.kernel.org>; Mon,  6 Nov 2023 19:26:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBF7FA
	for <keyrings@vger.kernel.org>; Mon,  6 Nov 2023 11:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699298811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/C/WjxiCVsJz9f1oEP2Y4XakhqVX5j64dRCa7+qXYyE=;
	b=FcePSch5UkLs10NJt2JqY85LzjWU8RYRduswJKD3g8lrjr4c7xh94pfmDM1Wj+N5r+4Bnw
	xNMOm790IjGCmOFMzX7hFGDrQyhVjNFryq1ul2wPOB+Ff7adNDheJ6KBCdxKk/dIjfwnt2
	3F2XpKIT7PsL2RH6ClFyH+Xz7OTZJ+w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-e0NaBhSaOweB7lpl0Eu3Mw-1; Mon, 06 Nov 2023 14:26:49 -0500
X-MC-Unique: e0NaBhSaOweB7lpl0Eu3Mw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-778a2e84830so533706585a.3
        for <keyrings@vger.kernel.org>; Mon, 06 Nov 2023 11:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699298809; x=1699903609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C/WjxiCVsJz9f1oEP2Y4XakhqVX5j64dRCa7+qXYyE=;
        b=PQV/4uxa97Ajpt7yCg1NY8BjFrcdWEe03RF1j/8KzsGroEPFF7JoaGeYmHmfjW2jPu
         qIVWeIT249nXeNmHE7PvwSjN4WY8AKpTDld/s53WfM5Bzq+AOBVHE7AEr/9B7/EgOq1v
         fSwSX6HVbth3Maxv4pml02FOIQ/amYmoO+zXOmbUlrD3fLk0gU8P2rSdiLT5zysQN04L
         vZju+wCX0q1RFsW33FoaaXnj91yXppa1ttc1kAKiyFfkwZhv/TMCvlFEx90IastguaBt
         YB60Om80OapuRJds6GY2xcH3oj/ctcKKjPZoWO3O5d8TBH9n9T+sgWCLR23KEoEgr3aD
         L77g==
X-Gm-Message-State: AOJu0YxlGHzqb1tSULvGwv3HnbN0KRsZcrZ6hxTmLWFhww5INhwSvAks
	KuGhGKsen4ldnKaNF3Mx9+jgTiDBfVe6T+KNRQiyR9mApSN4F6K5tU/cH8bTsYD/ZkGVLTg+bkS
	O14h1nY3HLTILtTtSxis=
X-Received: by 2002:a05:620a:444b:b0:778:9542:a765 with SMTP id w11-20020a05620a444b00b007789542a765mr40268959qkp.64.1699298809007;
        Mon, 06 Nov 2023 11:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4J4SaJitD2GuvTLmTEH/lixSVaiP4mCjrPIimN2+kmtJXKyqkH9XwjIiR80Gp98vcOrUInw==
X-Received: by 2002:a05:620a:444b:b0:778:9542:a765 with SMTP id w11-20020a05620a444b00b007789542a765mr40268946qkp.64.1699298808800;
        Mon, 06 Nov 2023 11:26:48 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x8-20020ae9f808000000b007756e75b91bsm3554551qkh.78.2023.11.06.11.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:26:48 -0800 (PST)
Date: Mon, 6 Nov 2023 12:26:46 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, William Roberts <bill.c.roberts@gmail.com>, 
	Stefan Berger <stefanb@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, James Bottomley <jejb@linux.ibm.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Julien Gomes <julien@arista.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] tpm: Store TPM buffer length
Message-ID: <lifu6orgfo57usei3szyfrmr6ofl37477gji5xh5bwkhftswxg@cjwwa5okjshi>
References: <20231024011531.442587-1-jarkko@kernel.org>
 <20231024011531.442587-3-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024011531.442587-3-jarkko@kernel.org>


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


