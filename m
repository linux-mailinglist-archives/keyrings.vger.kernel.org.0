Return-Path: <keyrings+bounces-4018-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GYqL77DgWnZJgMAu9opvQ
	(envelope-from <keyrings+bounces-4018-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 10:45:34 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4316ED708E
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 10:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77A0D3063ADB
	for <lists+keyrings@lfdr.de>; Tue,  3 Feb 2026 09:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DBC399005;
	Tue,  3 Feb 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="USzTc2XU"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549B28BA83;
	Tue,  3 Feb 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111785; cv=none; b=ThodsQScT0HMMt5GbmXzEuXWzFuuTRf71BuvJcD+NV2uew0KmVHWx9GS+dpkQJATwvQoRTHlLvW0axLHy9epAs3LMIe2Jdmw5mimoh3GkDTKUbsj2+u7UlqU6Sy4dPQ9ol98M8JZKnc/MOS3Wi/SpX7qNcVa5yyUxtHx/f1jjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111785; c=relaxed/simple;
	bh=lOZQHVi4hmxAUcpIgzZE60VaqTen2FCOq592t4zbDJQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eJME1rBDNRn5P1a/z9rKmbzrexsts5EKWI+2nN9bOSgFXVTjbvuUDAu4QetUMqHujyAo7nZ1ud4g5wgGRI4/SBlmuROCVRtTy+OTX/eOI5xav9bvEMmM6D9ytPNqWjsnvI2+M4s45VYGFY/ro66+DyrlTu1wXrPvfU84/lOQq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=USzTc2XU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 612KC6WJ032406;
	Tue, 3 Feb 2026 09:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gx3TgW
	DUvL3wItL6n9GMbEcEVu0dSA1u5L6Uc0rhGcQ=; b=USzTc2XUnlbkpQC8fXi0fU
	O6PJwu+58quhwQenf2XmZhHu07vwnC+RHDm5MqiuIPLotMOi9RCh64W0lbFFu1qH
	C8WRhS0/agYggRHQPMd3Gl11fu7WFZKBpg1xYRSrWDoSfOhp3bvdQ4zkckbUrThq
	8UlIb3RYC3QaZHdhrhMcm86H4Y2JOcppbYMn/Jc00QM0zJ1ix6qLs4jFhG29T05P
	ZZTvEj6kiiLiKV2tN9U/jbSu1CBoEJ01Zvvs+StmCOkjMDiLS7yfwyUubLPwZG6z
	LZ5ZcSPBcuvQSIspB+o6IQcmcL1/mDjttcPoetCOPv9D9/LvNZ2QcI5heCqttoFA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19dt4jyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 09:42:49 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6139gnkO012972;
	Tue, 3 Feb 2026 09:42:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19dt4jyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 09:42:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6135ud0w004466;
	Tue, 3 Feb 2026 09:42:47 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c1wjjrfw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 09:42:47 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6139gRox5112326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Feb 2026 09:42:28 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7552158050;
	Tue,  3 Feb 2026 09:42:47 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF71158045;
	Tue,  3 Feb 2026 09:42:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.248.127])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  3 Feb 2026 09:42:41 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <2416273.1770032906@warthog.procyon.org.uk>
Date: Tue, 3 Feb 2026 15:12:28 +0530
Cc: Michael Kelley <mhklinux@outlook.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
        Daniel Gomez <da.gomez@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephan Mueller <smueller@chronox.de>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7973F81B-FDA4-46EE-B4AF-2206BCB24861@linux.ibm.com>
References: <SN6PR02MB4157EE01F25375784EB7C507D49DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20260126142931.1940586-1-dhowells@redhat.com>
 <20260126142931.1940586-7-dhowells@redhat.com>
 <2315764.1769964282@warthog.procyon.org.uk>
 <2416273.1770032906@warthog.procyon.org.uk>
To: David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX+fqCqLe1n9br
 xgr7I/RG8e86X36QbM+/8bWSqs1g4vivrFpM+aZCk53DW4jPHUhWqtu5cq0rC0nV47cTyazk7o5
 sXE18zW0Cbsm1P+k2BYT65bfptKsYTOdamcg1iFSnFSH7Rl1L9mpO1VM7KvUXc8kaPbpidd3bC+
 aW+HcG9g0EYRkC8Xa+NIoCd0Qt/UxafemU3vgJlxHrpUkASPi8COwIv3jtTj6Ll0RGibt+wxMJ+
 XnVhfHrFcBhIUV2AxD5nQ4uc4tQoxsmYYVfhirigoOR7JlgvX1srd3vav69NYq1kE2ULf2qbDlL
 IUXH5zYqvg5FL1QRyprOfDoxidDDCo2RBxf0yYpXY2T56z8snH9uVsd12MEwJcl9KuPtMZckK4a
 xPXVGjCC3skVISFLrLs+sx/7urK8wQmE8nf1rtI6mqBEi4hJu9FvUSbOn+/kxXlzax03GNoY6dA
 KnO0jHDHV64YElze26A==
X-Proofpoint-GUID: H0IieDiGXO0GsQ90uT4aX8TWp8o6c3cc
X-Proofpoint-ORIG-GUID: vRNDAkrzWSujNhA_OPpjbpzNBVhrQJU3
X-Authority-Analysis: v=2.4 cv=LesxKzfi c=1 sm=1 tr=0 ts=6981c319 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=UqCG9HQmAAAA:8 a=VnNF1IyMAAAA:8 a=ASrTm7EkTYZRIX76TdgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2602030074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,google.com,wunner.de,cloudflare.com,kernel.org,gondor.apana.org.au,suse.com,zx2c4.com,chronox.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4018-lists,keyrings=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_TWELVE(0.00)[13];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,linux.ibm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4316ED708E
X-Rspamd-Action: no action



> On 2 Feb 2026, at 5:18=E2=80=AFPM, David Howells <dhowells@redhat.com> =
wrote:
>=20
> Michael Kelley <mhklinux@outlook.com> wrote:
>=20
>> Pardon my ignorance of the signing details, but I don't see an =
indication
>> of having selected PKCS#7 with SHA1 in my .config. What am I looking =
for?
>=20
> Actually, if you have openssl >=3D 1.0.0 then it sign-file will be =
built to use
> CMS rather than PKCS#7, and will use the configured hash algo, so you =
can
> ignore this.
>=20
>> The symbols CMS_NO_SIGNING_TIME,
>=20
> I can probably just not add that.
>=20
>> EVP_PKEY_is_a()
>=20
> I guess I can probably make this contingent on >=3D 3.0.0.
>=20
>> and OPENSSL_VERSION_MAJOR don't exist in the include/openssl/* files =
for
>> that old version.
>=20
> I should probably use OPENSSL_VERSION_NUMBER instead - though we =
already use
> it for selecting #includes (I guess #if doesn't complain).
>=20
> Do the attached changes work for you?
>=20
> David
> ---
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 547b97097230..78276b15ab23 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -27,7 +27,7 @@
> #include <openssl/evp.h>
> #include <openssl/pem.h>
> #include <openssl/err.h>
> -#if OPENSSL_VERSION_MAJOR >=3D 3
> +#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
> # define USE_PKCS11_PROVIDER
> # include <openssl/provider.h>
> # include <openssl/store.h>
> @@ -323,18 +323,21 @@ int main(int argc, char **argv)
> CMS_DETACHED |
> CMS_STREAM  |
> CMS_NOSMIMECAP |
> +#ifdef CMS_NO_SIGNING_TIME
> CMS_NO_SIGNING_TIME |
> +#endif
> use_keyid;
>=20
> - if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> -     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> -     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
> -    OPENSSL_VERSION_MAJOR < 4) {
> +#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L && OPENSSL_VERSION_NUMBER =
< 0x40000000L
> + if (EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> +    EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> +    EVP_PKEY_is_a(private_key, "ML-DSA-87")) {
> /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
>  * and before.
>  */
> use_signed_attrs =3D 0;
> }
> +#endif
>=20
> flags |=3D use_signed_attrs;
>=20

Tested this, and build is successful. Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.


