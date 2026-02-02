Return-Path: <keyrings+bounces-3999-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IcaHWqKgGnO9wIAu9opvQ
	(envelope-from <keyrings+bounces-3999-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 12:28:42 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774DCB9F8
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 12:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 971203004617
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 11:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF7036166F;
	Mon,  2 Feb 2026 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqPJTRBz"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B0A3612FF
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031670; cv=none; b=p9HrE/qvKyb4ls+6WWe7jgBUJp4xXP531/jgqCGD3DbOX3kV3aRrJ37QAa25Q3jKeo7dS55Y+HIsLpv1orNYk7yJ7ZGgrpOGYLScYQ1f3IPDqVlakmlRtLmjypyy6VyfmutCwFexm0HoE32a2kX6Vm6zuNFxGFkFXzH0l9CBMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031670; c=relaxed/simple;
	bh=b5+h1ZvPwA1I9hvBi0e/UCJgGnedMcqNKfhP1WPCgtI=;
	h=From:In-Reply-To:References:Cc:Subject:MIME-Version:Content-Type:
	 Date:Message-ID; b=OZhNU9tMZF+KaB7tkQ9wmR9vN4O7C7BjI8Gkxa6DEpv6UoI5wUuusBcdVX2lqOaSQ2l8ADXO/BRFzDgw/v75mWi3staa6CqG7M2bGutukgRmmYMs3PAdaDs4F/NjqBTeV0NzLEnm1XK6BjEy4coypdfc64rwRMHHScF4qOBOaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqPJTRBz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770031668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vt8i1i3wyzdt1qdgU9XEF1v51S15yEQJ5w2cnkXWKgo=;
	b=dqPJTRBzbXPoEvaBumcCeniKtAVxUeYkmXcRv7sYlknH5+O4syRzhcHHFrIl5aPAg16XBh
	5Mkq0JurdBPklhJaFbuNZaVkwMOWLnslnqpnr2Y6V5rtdwnM3/CKUJbRGhnqUL0bJ+PmGe
	6OGTdSbNFp3K7r8hCz8LfKYitKg3ihk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-fdMkf_IhMxiHfYncgiWY3Q-1; Mon,
 02 Feb 2026 06:27:45 -0500
X-MC-Unique: fdMkf_IhMxiHfYncgiWY3Q-1
X-Mimecast-MFC-AGG-ID: fdMkf_IhMxiHfYncgiWY3Q_1770031663
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62B9B1956046;
	Mon,  2 Feb 2026 11:27:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 849701956053;
	Mon,  2 Feb 2026 11:27:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2403737.1770031462@warthog.procyon.org.uk>
References: <2403737.1770031462@warthog.procyon.org.uk> <20251111154923.978181-3-petr.pavlu@suse.com> <20251111154923.978181-1-petr.pavlu@suse.com>
Cc: dhowells@redhat.com, Petr Pavlu <petr.pavlu@suse.com>,
    David Woodhouse <dwmw2@infradead.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sign-file, pkcs7: Honour the hash parameter to sign-file
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2404480.1770031659.1@warthog.procyon.org.uk>
Date: Mon, 02 Feb 2026 11:27:39 +0000
Message-ID: <2404481.1770031659@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_TO(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-3999-lists,keyrings=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9774DCB9F8
X-Rspamd-Action: no action

David Howells <dhowells@redhat.com> wrote:

> @@ -56,6 +56,7 @@
>  	defined(OPENSSL_NO_CMS)
>  #define USE_PKCS7
>  #endif
> +#define USE_PKCS7
>  #ifndef USE_PKCS7
>  #include <openssl/cms.h>
>  #else

Apologies, that line was so I could debug it and should've been removed.

David


