Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7795228C222
	for <lists+keyrings@lfdr.de>; Mon, 12 Oct 2020 22:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgJLUSK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Oct 2020 16:18:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22154 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726814AbgJLUSK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Oct 2020 16:18:10 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09CKGHWp012068
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 16:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=UB/nlPW+wxNn62SS0RFiKeJRXAtNnMAX/jDEDVg4xMw=;
 b=nf5DSsw/nBK1qpVXZ47z4qpOgON8leHLUv4D07SuEETC3uYbfqtLd2Kviw1nKuNB8p6f
 Yic0nP+iLKQUkG0X3N/et/Iej8j7jm7rS5TcojfX/x8z99iGXPK7QTvk7jPGyZFvUy7M
 2/5Ov9lpjxY/nwk+M26ltdPy/3AJ4dDVzvmfqBZRI0cvjwanP5MNbaEnlR+oofIfMUD+
 EHtJ9nvHtpGLI5FQ4HEv/wnDN+EDwDOnqCxaHGGhTAGqjaETm/x6hrrCsRikURWh+7yJ
 FqVCcwIPBilxFi/uqR7/KC50l3G6qucDnNmDa+x88+wxmjHBjEI2hBRTqJuN9POrMclA 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 344x1k80ta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 16:18:09 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09CKGKhI012265
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 16:18:09 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 344x1k80sx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Oct 2020 16:18:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CKGcan028153;
        Mon, 12 Oct 2020 20:18:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma03fra.de.ibm.com with ESMTP id 3434k7s6vw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Oct 2020 20:18:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09CKI4WZ29425962
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Oct 2020 20:18:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9B8425204F;
        Mon, 12 Oct 2020 20:18:04 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.17.200])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BCAB35204E;
        Mon, 12 Oct 2020 20:18:03 +0000 (GMT)
Message-ID: <17400748c976eb3964c5356fe41b3cca3cd23d65.camel@linux.ibm.com>
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Anatol Pomozov <anatol.pomozov@gmail.com>, keyrings@vger.kernel.org
Date:   Mon, 12 Oct 2020 16:18:02 -0400
In-Reply-To: <20201005225258.200181-1-anatol.pomozov@gmail.com>
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-12_17:2020-10-12,2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010120150
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Anatol,

On Mon, 2020-10-05 at 15:52 -0700, Anatol Pomozov wrote:
> It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> Adding algo name makes it easier to understand what cipher has failed.
> 
> Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>

The "if" clause in the Subject line doesn't belong there, but in the
patch description.  I would start the patch description with "Improve
the cryptic message ... by adding ..."

> ---
>  security/keys/encrypted-keys/encrypted.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
> index 192e531c146f..c09d48f53682 100644
> --- a/security/keys/encrypted-keys/encrypted.c
> +++ b/security/keys/encrypted-keys/encrypted.c
> @@ -84,8 +84,8 @@ static int aes_get_sizes(void)
>  
>  	tfm = crypto_alloc_skcipher(blkcipher_alg, 0, CRYPTO_ALG_ASYNC);
>  	if (IS_ERR(tfm)) {
> -		pr_err("encrypted_key: failed to alloc_cipher (%ld)\n",
> -		       PTR_ERR(tfm));
> +		pr_err("encrypted_key: failed to alloc_cipher for %s (%ld)\n",
> +		       blkcipher_alg, PTR_ERR(tfm));

I don't have a problem with including the blkcipher_alg in the error
message.   It is currently defined as "cbc(aes)".   Is it ever anything
else?

thanks,

Mimi

>  		return PTR_ERR(tfm);
>  	}
>  	ivsize = crypto_skcipher_ivsize(tfm);


