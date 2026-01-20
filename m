Return-Path: <keyrings+bounces-3845-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB/VJEjOb2mgMQAAu9opvQ
	(envelope-from <keyrings+bounces-3845-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 19:49:44 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517B49C9E
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 19:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4E0766CAEE
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7278C4418E6;
	Tue, 20 Jan 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QE4y7AaW"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95FB43CEC6
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922921; cv=none; b=Zyd++pBNSAw2pedxnyyk56/3PznM/wrLLb3rfXM0hti4480thHuGCH5UMrt+IqEM8MEdKPMnDcJqJZQ9sNWLv34MKJw9Tnjb+IALadLonUVAe7fETB4jmxXin1DyS6ePbw8ryKYh/Jv8UmUTqOVozoNShGw0njwZfA6QoKSN1xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922921; c=relaxed/simple;
	bh=0sMmu5gg8UFyAWe/IH29MMMVB58NdXu2+b0v3ORUzhg=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=SoakhPMMLBzDt/F+bLhQJBGF8W5mH6gmV9CtzXQv1rT6If/F0zs6EhQOM8IjcUASplC3riesBpciAD1GHQkcbMTjpoeQaQCaMgCjXExVT1iHodlksdRpTHTvw9UFlhTy2cr76//V9WIcw7RlAbLgeVTjUTNfMjUwy2OfNNIf1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QE4y7AaW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768922918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/unPafAPOoP3LjRvac8Gzs8rjFGIe5eacRzIB3ctjc=;
	b=QE4y7AaW6K0wIBaEKXH9v0+lRxjAZWoehkwH0hzQ4SguLHACyEmzQgpdePRwTNttP4gmAQ
	Z/LCWPrMJzbTVIrA8sjmNhrzbM9ofW9AcokcPHi/q4roQ7e72XHVRkHbdvzcHWi5JW7JD9
	YRiD/WVSG0ZMs13Qw49jzdw0p2DKqnY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-wc0lwKm0NwWG-NM39PZcOQ-1; Tue,
 20 Jan 2026 10:28:35 -0500
X-MC-Unique: wc0lwKm0NwWG-NM39PZcOQ-1
X-Mimecast-MFC-AGG-ID: wc0lwKm0NwWG-NM39PZcOQ_1768922913
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 507351955F45;
	Tue, 20 Jan 2026 15:28:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF570180049F;
	Tue, 20 Jan 2026 15:28:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALrw=nENf3T=8MHPpt-wdneLupkzADpgDuHA6Gni_=C5-o_MjQ@mail.gmail.com>
References: <CALrw=nENf3T=8MHPpt-wdneLupkzADpgDuHA6Gni_=C5-o_MjQ@mail.gmail.com> <20260115215100.312611-1-dhowells@redhat.com> <20260115215100.312611-9-dhowells@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 08/10] pkcs7, x509: Add RSASSA-PSS support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1177987.1768922903.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Jan 2026 15:28:23 +0000
Message-ID: <1177988.1768922903@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	TAGGED_FROM(0.00)[bounces-3845-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 5517B49C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ignat Korchagin <ignat@cloudflare.com> wrote:

> > +       struct rsassa_parameters *rsassa __free(kfree) =3D
> =

> Did you mean to use the newly added rsassa_params_free() here?

Err, yes, I should have done.

> > +DEFINE_FREE(rsassa_params_free,  struct rsassa_parameters*, rsassa_pa=
rams_free(_T))
> =

> So you use plain kfree() in one instance and this custom free definition=
 in
> another.  We should probably pick one.

Yeah, both should have used the custom one.

> What is the idea behind this custom rsassa_params_free(), if it just cal=
ls
> into kfree()?

In case in future something freeable is added to it, it seems like a good =
idea
to have a destructor[*].  Other mask functions are theoretically possible,=
 for
example.

[*] (Since we seem to be reinventing C++ ;-)

David


