Return-Path: <keyrings+bounces-3985-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EcerJyxQf2lYnwIAu9opvQ
	(envelope-from <keyrings+bounces-3985-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 14:07:56 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3FFC5F8D
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 14:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A69CC300D310
	for <lists+keyrings@lfdr.de>; Sun,  1 Feb 2026 13:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0794B34676B;
	Sun,  1 Feb 2026 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="bVMWWEhE"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426C23A99F
	for <keyrings@vger.kernel.org>; Sun,  1 Feb 2026 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769951273; cv=none; b=l0IuCvq2sGoBU6RZQ7dLh/hgVCbxrcewLjq7MWvaKLf1fn2h0gDLGTI19jTcGms+aXFAQ6+eXk8ZvyCTJCoSIYvzD0nKyqCV5Awzxt3rVt5spYBoU+CSU+IL3NZP+DDImjvO3bYrQVbTI8ti2mJ71xe7UgVwOcu9ClQtUIlWTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769951273; c=relaxed/simple;
	bh=Kwjp0+tVL9gMgYzKUXBYu1GRVe0BL1N/TmqXrs9Uwf4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G35KguEnfkpDDpait6NQ0MUjjXyNg3NmPhCWTNtfS6UKI12FGi+TVxtuYREv3AR8mlOBoHyX0QKSitByou47Hv+cmTgfv/0htbdWO27d5nwnE5CwJiFhQyAUq4cBSqKq/53Mr6NQoXZ68hp8nCL+Ugd3A1aGZ+YP+Ary+LGv4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=bVMWWEhE; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6110EPR53324234
	for <keyrings@vger.kernel.org>; Sun, 1 Feb 2026 05:07:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=AkESveN7TgNqfMbvTOPgaDQqBlCntqg8iMdsdi3eFAU=; b=bVMWWEhEBxjE
	rUsPm27UoRCcx5AZ/bRG459qP5Pnw1Y7+JxmIfL1TXw00qAb0J9m2rxQQ1rAYjJX
	4B8uSNXXLMn4zsXoA75cRxaQJDI5WXa4QoGY2tc+plUmiDFZ8FTtnUjmrXBJ0sDN
	Wv4WvghZpEXzsJMVwVLKPJWXEovYte34aVtvqq0yvKBtAikOoZ85/XhJ7UnaNm9/
	EIdeibhpzArPbbxeq/1sCEcKDg6AFXOa1ZvJTNNAkRusnLgvQfS/BOPl7vsh0tAi
	KHtHEiA4MVuF2x+SZ+GiH47jBQAkINale3q7yuX11flD16MV56OM8Th1fSF8cFz0
	pPsoKVXfRg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4c1gbeyef4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <keyrings@vger.kernel.org>; Sun, 01 Feb 2026 05:07:51 -0800 (PST)
Received: from twshared41309.15.frc2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Sun, 1 Feb 2026 13:07:49 +0000
Received: by devbig010.atn3.facebook.com (Postfix, from userid 224791)
	id 559387B1FB6; Sun,  1 Feb 2026 05:07:38 -0800 (PST)
Date: Sun, 1 Feb 2026 05:07:38 -0800
From: Daniel Hodges <hodgesd@meta.com>
To: Ignat Korchagin <ignat@cloudflare.com>
CC: Eric Biggers <ebiggers@kernel.org>, David Howells <dhowells@redhat.com>,
        Lukas Wunner <lukas@wunner.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, <keyrings@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: pkcs7 - use constant-time digest comparison
Message-ID: <aX9P2Y4AUuetwIPF@fb.com>
References: <20260201035503.3945067-1-hodgesd@meta.com>
 <20260201044135.GA71244@quark>
 <CALrw=nG0Pj1W-bZ6qQax0WnxSayCtYx97ivRuQMsVZHbsQZong@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CALrw=nG0Pj1W-bZ6qQax0WnxSayCtYx97ivRuQMsVZHbsQZong@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-Proofpoint-ORIG-GUID: naswpS4pXzu_n7Likf3cfnUCQZMtq7cw
X-Authority-Analysis: v=2.4 cv=Ja+xbEKV c=1 sm=1 tr=0 ts=697f5027 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=-oXVGbNiZCuEa3XDEhEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDExNCBTYWx0ZWRfXzcpNmLdEDir9
 Pi4X9IgEG1P/3+cesLKvfh0kQhEFZPYNBEJ+D4clqY7Jhdd6VYOaNSssdaCFaVTKEgbJEi1/cdz
 NqAkB21Zyi3hqyi6UeNDSuZKZvo5zZIHgTWWzNxc8FmqPf+myQyWWu1W7TXjGSvKJm5EWcE4eXh
 E7AodtbYF/AkGa9ptqEMQLQ+ewJ6dCft8+X1EMpnXWGBvoN22CLP9/TgZ2+ffXfNOchSe7xw06j
 qr1rdmvGfhpsGDTv/gWnOyB9x2XqFzgQ/PqQA9QnCSfxmfHylGd6TW1tW1AxVF3KiOlqBVXaceh
 es+Divf1XpN/NRZxnzjwDfntFNRbB6zi2Sq1gb3Z4BHTfY/J1/GCb3xz7QCUxtyEfB5FINK7ZCw
 ks9yqC37l4AkaVhPTFqAftZdQ0ANF5d367cJye1Dp/b1yMZkYwae2ZDIK6Y89CGnHF2DpQpTs49
 RKjTy+S30TGvJlo7BiA==
X-Proofpoint-GUID: naswpS4pXzu_n7Likf3cfnUCQZMtq7cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3985-lists,keyrings=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fb.com:mid,meta.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hodgesd@meta.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC3FFC5F8D
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 11:55:26AM +0100, Ignat Korchagin wrote:
> On Sun, Feb 1, 2026 at 5:41=E2=80=AFAM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> >
> > On Sat, Jan 31, 2026 at 07:55:03PM -0800, Daniel Hodges wrote:
> > > This creates a timing side-channel that could allow an
> > > attacker to forge valid signatures by measuring verification time
> > > and recovering the expected digest value byte-by-byte.
> >
> > Good luck with that.  The memcmp just checks that the CMS object
> > includes the hash of the data as a signed attribute.  It's a consiste=
ncy
> > check of two attacker-controlled values, which happens before the rea=
l
> > signature check.  You may be confusing it with a MAC comparison.
>=20
> On top of that the CMS object and the hash inside is "public", so even
> if you have state-of-the-art quantum computer thing you can just take
> the object and forge the signature "offline"
>=20
> > - Eric

I just went through the code flow again and that makes sense, sorry
about that!

