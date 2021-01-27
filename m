Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F173067BB
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 00:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbhA0XUm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 18:20:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31544 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235492AbhA0XQz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 18:16:55 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10RMYjmt138517;
        Wed, 27 Jan 2021 17:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=njFP7oqBoviyf5bi+AHjoz5cMlCGKKGRIQFxuHRNe/U=;
 b=eMSjqMpksqhgJ7oqJCxSJJS1JPBgBhemp89a+VNR8m/8W6zQVltgf9OvqgDZ3KykCBdh
 yyWqtrFsDPF1lojJ4ONFli5FpkLPezflfQeWv7W8GTXC2TyFgaulQlbXfI/UjdZnRG4U
 hScoB8KyzS2fmauPhVOEaXzJBKbRbTIdy/uYQ/vNL+hQMH6S2ggx1uGD2/WUCGSO75tN
 kvUlinhkJWMkH30o7k6ZOlaYCn7V320mwjCln57UKyVArM9F7A6UfAbg2+Z0zIHy+vub
 3xVaRnRdqKAXnkoPbGm4AOaeHV1iBvxHIwbXuxVR+NINpjhNnFJ4FjrnwlEN6jFywGIy rA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36b5awjmn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 17:42:23 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RMYpge139217;
        Wed, 27 Jan 2021 17:42:22 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36b5awjmn0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 17:42:22 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RMavb0030082;
        Wed, 27 Jan 2021 22:42:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma01dal.us.ibm.com with ESMTP id 36adtu00m2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 22:42:21 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10RMgLI528180932
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jan 2021 22:42:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1BC69AC067;
        Wed, 27 Jan 2021 22:42:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0AE49AC069;
        Wed, 27 Jan 2021 22:42:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Jan 2021 22:42:20 +0000 (GMT)
Subject: Re: [PATCH v3 0/3] Add support for x509 certs with NIST p256 and p192
 keys
To:     Nym Seddon <unseddd@protonmail.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     "dhowells@redhat.com" <dhowells@redhat.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "patrick@puiterwijk.org" <patrick@puiterwijk.org>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
 <yOgLSllWWtGlr6OYcQxe8CeFwK4H9cWzWbalszgSv4xN_DxK6AGG_vNRyuVX6aKHzesDaj0LK9pB0q8SIQWXQETX26J6KXe428OPMHJYvus=@protonmail.com>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <fa061535-4870-215f-aacb-710cc086e8a9@linux.ibm.com>
Date:   Wed, 27 Jan 2021 17:42:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <yOgLSllWWtGlr6OYcQxe8CeFwK4H9cWzWbalszgSv4xN_DxK6AGG_vNRyuVX6aKHzesDaj0LK9pB0q8SIQWXQETX26J6KXe428OPMHJYvus=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_09:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270110
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/27/21 11:12 AM, Nym Seddon wrote:
> Hi Stefan,
>
> In the recommendations from SafeCurves (https://safecurves.cr.yp.to/twist.html) there are a number of attacks against ECC twists. Two of those attacks are relevant against NIST P192: invalid-curve attacks and invalid-curve attacks against ladders.
>
> Both attacks can be mitigated by checking the supplied public key is on the correct curve, before performing curve operations.
>
> Not sure if the right place for those checks are in the signature verification code provided in these patches, or when reading public keys from the certificates. Does the kernel provide functions for checking curve points satisfy their respective curve equations?
>
> There are also tables describing the cost of combined attacks on various curves, where NIST P224 already falls below the safe threshold. Because of that, I would recommend not implementing support for NIST P192 (since it would fair even worse).
>
> What are your thoughts?


I am calling into a function performing such a test at the end of the 
function parsing the public key:

  return ecc_is_pubkey_valid_full(ctx->curve, ctx->pub_key)

https://elixir.bootlin.com/linux/latest/source/crypto/ecc.c#L1458

Is that good 'enough' ?

    Stefan

