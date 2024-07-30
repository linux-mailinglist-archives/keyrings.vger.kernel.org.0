Return-Path: <keyrings+bounces-1836-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F0B94139F
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2024 15:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F002F1C20C0F
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2024 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9221A08A0;
	Tue, 30 Jul 2024 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f3/QYAAG"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E5198856;
	Tue, 30 Jul 2024 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347462; cv=none; b=eP6BNHVBpmHSS3El3zyuywAQJDKcRPQoSQcAKNGI9Rl3ALyWjKLAYYDoxScYuqEU19IdEJAPCSK1wDd3WYUx3dcEril7agdiBafU885RMSDltE5lAwUVhRm7YOMPkfV6qbG/C5130WOaFMfoUm8foKHRiS3pQB6N8OAUStxvhKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347462; c=relaxed/simple;
	bh=QIrpfDYRgcW7cmxsQDnufdlZBXwtZhDU5/0XxZliC5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnJ422LOR50l3dZ1VIdOpoVqBFonr5WJS5XO2WzSAxypL9TR/NLExWtiVN7R/3/tLZ02nZRL/UV5S8Vg/jMmNW5Amw0vlkXfrDCdqAk+NVPCuw6E+YmNfHPZ7Y8/7ubkl5xcJcnbwX33DYvs7Be/jV/+oJcXV4fszcz7nH+4U1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f3/QYAAG; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UDSjeI031591;
	Tue, 30 Jul 2024 13:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=f
	Uv4QxtIdsR4jv7WkdAdTjk3y3C+YOSCF/nyLvLsIM0=; b=f3/QYAAGdO+Dpk1gq
	IXS6Y2ddc+lbqEcB9ceh0hWy4CCBMMPvjKCVXRypWKEjqXQfrKGE/m8TN5Ru3q3U
	CenYBDxXf2bJj587DUGof9XF77vI+dTCDn4EKT0ohPKivi12MtMOopLJ9UgXTlef
	sk2YI3x1Pc9sfGaRNRXuqPFrOHQ7pVuA705Aw68sAX2tjR32s8ANAifs1o225Z/3
	PMqcuUWS6CtV90Gnu8draV+DtKT7zfBL+52YJy3CSXZw36jgBFuGYZ34b7C6nXOt
	qmV0JRen0s26cC5tCMdEReYAHgJvVMhl2DsllqRo3YVLcHz9L9Z17kTaRK9SZv/J
	Q+9lA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q139r1f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 13:50:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46UDob6K002968;
	Tue, 30 Jul 2024 13:50:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q139r1f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 13:50:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UBA68p018867;
	Tue, 30 Jul 2024 13:50:37 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nc7pmxdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 13:50:37 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46UDoYEj13107868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2024 13:50:36 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 186C658064;
	Tue, 30 Jul 2024 13:50:34 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E12358050;
	Tue, 30 Jul 2024 13:50:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Jul 2024 13:50:29 +0000 (GMT)
Message-ID: <f6ec8fe9-b142-49bd-98e9-28f54b71dca0@linux.ibm.com>
Date: Tue, 30 Jul 2024 09:50:29 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASN.1: Add missing include <linux/types.h>
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>,
        Tadeusz Struk <tstruk@gigaio.com>,
        Andrew Zaborowski <andrew.zaborowski@intel.com>,
        Saulo Alessandre <saulo.alessandre@tse.jus.br>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
References: <cover.1722260176.git.lukas@wunner.de>
 <a98ae07646e243fe0d9c1a25fcb3feb3e5987960.1722260176.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <a98ae07646e243fe0d9c1a25fcb3feb3e5987960.1722260176.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NclXsB--uMF2Zs6hSBmuz7fvaoY1PQ6E
X-Proofpoint-ORIG-GUID: oyPDAH6UvUlRLLOIP3TOiey58PqXrej-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300091



On 7/29/24 9:47 AM, Lukas Wunner wrote:
> If <linux/asn1_decoder.h> is the first header included from a .c file
> (due to headers being sorted alphabetically), the compiler complains:
> 
> include/linux/asn1_decoder.h:18:29: error: unknown type name 'size_t'
> 
> Fix it.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   include/linux/asn1_decoder.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/asn1_decoder.h b/include/linux/asn1_decoder.h
> index 83f9c6e1e5e9..b41bce82a191 100644
> --- a/include/linux/asn1_decoder.h
> +++ b/include/linux/asn1_decoder.h
> @@ -9,6 +9,7 @@
>   #define _LINUX_ASN1_DECODER_H
>   
>   #include <linux/asn1.h>
> +#include <linux/types.h>
>   
>   struct asn1_decoder;
>   

