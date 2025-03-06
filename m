Return-Path: <keyrings+bounces-2446-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C2A5433F
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 08:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C4531894603
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 07:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7244C1A83F7;
	Thu,  6 Mar 2025 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNf0m7ma"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE191A5BAC
	for <keyrings@vger.kernel.org>; Thu,  6 Mar 2025 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741244764; cv=none; b=XHSAs47Y+2IBpILEHkYVk5R1v3t/fGc9BqI4P8wo/6AkmZwh10A9ksg0Mow46IW8DWSq7CSbRQExSftiIcJ28baIJQ2Vrt/AbHDDPng/Ihm5Ay8A3VP7eGjGbVtOVunRGRnCRseFYEKadP9qDOd/Acevt/CYw5Wdih2zvfx1N/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741244764; c=relaxed/simple;
	bh=jhWOcXyD54EKw7A/5hxlnKy9KlURAGCKN9CTet3a/6c=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=szAx4MGqQsiuLixQiLxt2wx2m0TRAd4v3/VTk5jWRRYQpDRuPd/pt16W1qO8E8pCuuVpu6m5Vt9EGfdQmGU8RfTkobtRcRgeStCG2aqtdyt50OMtd33E5/gdETvw5WlZMdOJVbcVHTdeg8T5n/PAK2sq5dIaomkrSE0YInwBq0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNf0m7ma; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741244760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZmNayth8nNV8L3lfDhYpOawH7iYgqiELXF3kNzD034=;
	b=aNf0m7ma3IH1ygH+yBFQGJdZTYWKRdyWaqU0ozZN/VR5SJ8z+7ht7M9vW1R9FRdx0J96a9
	aAwV2JOVPUvDDkzrof8IIlhVtTRQMBCKTg/3+1Y1kH+Wr/+04enxeiVCRi08xx864rPlGc
	kNl9h9eHpzmictYe2/cMuJbhWzoBeyQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-0POG-HYEP6GSjrjCx2fTEQ-1; Thu,
 06 Mar 2025 02:05:41 -0500
X-MC-Unique: 0POG-HYEP6GSjrjCx2fTEQ-1
X-Mimecast-MFC-AGG-ID: 0POG-HYEP6GSjrjCx2fTEQ_1741244740
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95D5D18001F8;
	Thu,  6 Mar 2025 07:05:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.200])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B8ED180AF7C;
	Thu,  6 Mar 2025 07:05:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
References: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Stefan Berger <stefanb@linux.ibm.com>,
    Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>,
    Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric keys
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Mar 2025 07:05:33 +0000
Message-ID: <666.1741244733@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Lukas Wunner <lukas@wunner.de> wrote:

> Herbert asks for long-term maintenance of everything under
> crypto/asymmetric_keys/ and associated algorithms (ECDSA, GOST, RSA) [1].
>=20
> Ignat has kindly agreed to co-maintain this with me going forward.
>=20
> Stefan has agreed to be added as reviewer for ECDSA.  He introduced it
> in 2021 and has been meticulously providing reviews for 3rd party
> patches anyway.
>=20
> Retain David Howells' maintainer entry until he explicitly requests to
> be removed.  He originally introduced asymmetric keys in 2012.
>=20
> RSA was introduced by Tadeusz Struk as an employee of Intel in 2015,
> but he's changed jobs and last contributed to the implementation in 2016.
>=20
> GOST was introduced by Vitaly Chikunov as an employee of Basealt LLC [2]
> (=D0=91=D0=B0=D0=B7=D0=B0=D0=BB=D1=8C=D1=82 =D0=A1=D0=9F=D0=9E [3]) in 20=
19.  This company is an OFAC sanctioned entity
> [4][5], which makes employees ineligible as maintainer [6].  It's not
> clear if Vitaly is still working for Basealt, he did not immediately
> respond to my e-mail.  Since knowledge and use of GOST algorithms is
> relatively limited outside the Russian Federation, assign "Odd fixes"
> status for now.
>=20
> [1] https://lore.kernel.org/r/Z8QNJqQKhyyft_gz@gondor.apana.org.au/
> [2] https://prohoster.info/ru/blog/novosti-interneta/reliz-yadra-linux-5-2
> [3] https://www.basealt.ru/
> [4] https://ofac.treasury.gov/recent-actions/20240823
> [5] https://sanctionssearch.ofac.treas.gov/Details.aspx?id=3D50178
> [6] https://lore.kernel.org/r/7ee74c1b5b589619a13c6318c9fbd0d6ac7c334a.ca=
mel@HansenPartnership.com/
>=20
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Seems reasonable.  Unfortunately, I find myself a bit strapped for time.

Signed-off-by: David Howells <dhowells@redhat.com>


