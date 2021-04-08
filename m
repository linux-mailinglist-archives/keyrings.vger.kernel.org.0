Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2EE358716
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhDHOWZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:22:25 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:47343 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231893AbhDHOWX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zrKe4oO83MQnVExP9l3JAk4JLhB4lt95A8UP19h4rPA=;
        b=HPKl79vC4F7L+xlwyJ83ryEHC4KbYUBLbrLyiVVoWKgQkLWGXQXdbskzVglg89j5d46FvL
        30BsBrQZzmaki50gwk8Z9er0weo21CR9Wk9e8dD7jV3GBPVthniXHKq7257PLQ1TUvWkQy
        RswrpDoIDdSmBgAWJkMmDqJrYsEuZoY=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-2u-o-mmrOG-ighrimt-FsQ-1; Thu, 08 Apr 2021 16:21:59 +0200
X-MC-Unique: 2u-o-mmrOG-ighrimt-FsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdY27VV4KwFMi3lB+GvWkwLJNgUsQhffySfwZINGZ+zSMY3cWLZpi/+MoQUn4Np9gIWsYfGsMrL/uG+8xPwO2P6vh8WeNYDBreXj5GyfuOGoARNf44oCNtn6TAQJSAAGU6k0xFGVOoDflcNzbm39yPA/1HUiengL4Hy3zhakqcUCQoCD3L6Si+qAHXWZCDME35++eRUqZgyE4sU9xCqDXwFcVhn4l/pi8jtfa7stE3UhDpQSoV3mj9int+apUdEJ+jcQKQFTu8UBbe4+thdmw3M0gO5RzxoC9NRR4MHckMaSgIrzdcvZ8V2yTbsd3oywXFgxSgZCYGQt5mnhbWih3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezfDBMHHkqGCzOPwEJavtpJ+Mqy2QLVv1dKnlC40Y4k=;
 b=NPqloG47bSSdkV4sA8PXCjXAxkamJavQd5/lnMCyW4+nX9hLNYooXgo9z2PJWPd76rzuaM23ByiJktpiOnCA+zaYx8piG/JjGpPdg9IQ3U003zfK37s7l/KUAO7vNQnIvrkwrnkb7hn8PRi37NiTKgeM0PfrCXRmCwpvaPS42y0MVIsz/cbSRBusQLW1Iw/78TixmsPTQP1SdAlnkVG5jEXx05byEEv/Ur920kQVVYnDtmD8TBD9JVg05DiXAF8MxuqRUN9ad5sIqOJ9HC40u+a1hlpe+w751E0Q+AIoznoRf5UsAo4y95/4WjXvOSPoYVzl3e+T2wLrCfTTl4z1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB7058.eurprd04.prod.outlook.com (2603:10a6:208:195::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:21:57 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:21:57 +0000
Subject: Re: [PATCH 01/18] X.509: Parse RSASSA-PSS style certificates
To:     hongbo li <herbert.tencent@gmail.com>
CC:     linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210330202829.4825-1-varad.gautam@suse.com>
 <20210330202829.4825-2-varad.gautam@suse.com>
 <CABpmuw+ht5BmNtqN+pJt7A0ZHp7JJArZtj51hkhBc96L8iwvwg@mail.gmail.com>
 <29804310-e75b-80fb-81a3-0823b06827ea@suse.com>
 <CABpmuw+br=4N7OV8KXR7iZosGj7SVKMS=DV_-axgMgsh-+189A@mail.gmail.com>
From:   Varad Gautam <varad.gautam@suse.com>
Message-ID: <f8b437e5-56de-2b45-b835-bdf0ee1968c0@suse.com>
Date:   Thu, 8 Apr 2021 16:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CABpmuw+br=4N7OV8KXR7iZosGj7SVKMS=DV_-axgMgsh-+189A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::23) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.67] (95.90.93.216) by ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 14:21:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6d30571-dee1-4e7d-fe5c-08d8fa99aad7
X-MS-TrafficTypeDiagnostic: AM0PR04MB7058:
X-Microsoft-Antispam-PRVS: <AM0PR04MB7058408E864338E5E5609E7CE0749@AM0PR04MB7058.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrHgF9RBsNUZfykVOyje5qHvFXYvriSFe3pmn5ZyxrmtJurhxvFHDcpMNvRwSkt5uRo/AbHm7kPHR/sArLwzWZqWspXOG+HlqjLKzmgH8VXkpP/ljrZ8lLlmgbvXTuolDyvq98nbuXak3ARtc3Fr5294+siagrOcJqFvAJfdcOyfrPrM5ja3Sv01KuiOXNs9EPCj0rT01saToW6r55ce8SykcHq1cArXTMn2itoCM+Lw5nEZQNI3seOQngzL6B2eFIVlrDlldauNfxITMllw+vy5D7ZJ5Dsnr9rK1UK1QiPMHj+nzbky7ULn8DTqKSStNaj1UwZDbtcAWJEUQPx1J80nghff26+YuA7AS6AZ78D+g+WzMjEQmAB24WH+yKKnAZpRUUk6wHJtnLUW6oYZkZW01VuNB2bu6XTV8FUWxwcVf5jab+GKJ2q9DSj5E3lEfWuMzlCxnaZlcx45whXxI2DLTVN1wFXC+sLQeEWDNy88D+99VD7vBIOug7a4vfVuHlecYmb/8q+6n/Bb54EwTuJz0JyDhJyaHRRKc7Q+T0uCYtnE/BgT34d3vtahWjtjjGTp372sJAXGjQ7m86acXkDt8w3KzgpI5TaAP2b38NBOV7tH2jh2030+sCZl4zcPEQkEOOxq+QuwCQ5vaQYfTy1udSnkzjBHhW+iQUL64h/c1/kytvbbUcrVL8IhiX9IJG+kUDB2iCijRCYX/6ZqoRi3r4fJOA1tYYshmr/LkCBrg9z+sHtZLxDYLZpo7AzL5AvP1sKSh8EreCMvYP8bqPA+kvJgBKgjgaHEcC6S+Xv3pucYG7chpCp52mQ2qTXY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(956004)(31686004)(5660300002)(316002)(53546011)(2906002)(44832011)(2616005)(36756003)(4326008)(52116002)(31696002)(8676002)(6486002)(966005)(66556008)(38350700001)(66476007)(66946007)(86362001)(478600001)(83380400001)(54906003)(66574015)(186003)(8936002)(38100700001)(26005)(6916009)(16576012)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rpJwZ9FdBpPPmwvVAGutLKgf1+0+stTSMuAAO9XjIqujhyZXNwazCasTjci5?=
 =?us-ascii?Q?qsymGf2anzBhWPFAk9cBYwjtS/U5zd0jjoIWkGNDGQu79eBfO+kSxTu7Xc2h?=
 =?us-ascii?Q?CH2Zgpzxeu0NBXtCOLcNCvWwzgEUjpwKQnwKL6AiFDmoD1VY4dQMpEjNJH0G?=
 =?us-ascii?Q?t2xNhOCzMVxrRW2rjOL2XEwBpCjcDE+VTN82zHvYOSiD0OYbFeKD6GxxGr20?=
 =?us-ascii?Q?UIJL2C+MCZDPi4Ht6pZX9suEAO8PB1g4zfqzS66RnFkwykwA5iDQlrGrpAr4?=
 =?us-ascii?Q?GMiUnse+jUOhQBybzBxAfm8hi8Yq2b7tjwPuN0zkr/bbi+ogU+kli2CT3BkT?=
 =?us-ascii?Q?3zJ1A/i44KmLy3OfnpqImuVLUyc19pxi3gBXkaI+J8FqlpYZzEQr13SyJnPT?=
 =?us-ascii?Q?9XqY8rXAs7Pqrjj3patv1ivNghJwMvfAS1AnGfSVoyam2edJPU9kv9q05WRv?=
 =?us-ascii?Q?H+FhYhm+xdn9OP69MqhcHo013i0enC8gxN6SOisA5zKwEcAsRH6QAEm//nR6?=
 =?us-ascii?Q?zwm2xPaKWAEQG6Nn9bl4Nc4G/yBR0UxIRFWZp5O9katxE0m3xJGBrRtEFnSD?=
 =?us-ascii?Q?uSbutnTXC/klDCaTw888csv43wmHU3UV55GA+G4dNkkknw7aNTAM05mUiHy2?=
 =?us-ascii?Q?V2Oj1ttNCOpJs9SQdWSzIqV96o7yNwzOOHtV9nYNog3vs0JuBb21+0jr7W94?=
 =?us-ascii?Q?vXx55SFt7SJlI4Otgc5Nsxv8UBqxnWYR+Y/l6uRDofa7Jy+I9g+l9jJXW3lc?=
 =?us-ascii?Q?DGpX4+ZwySct4l9WZ9GrknGUUQCpMyT6ugmLe3j1RipyKgUsGjaYkmqEdjPk?=
 =?us-ascii?Q?YDbNSfYT1V4XmOu0Kv60eBeJV1Tx8vQEOSXbJnat9oyW1e+cipstfXE0JrqW?=
 =?us-ascii?Q?d2afHu5LTFeLzwkORFRkoTn43ZvfSmtw0s1HjI/l/6/egiXVk/j8cCVMUg2e?=
 =?us-ascii?Q?AMfZbKvcH2yHwZ4hWiWiLiobNY9RlHELdEDjNwvG3LX8BDuXHCzGAFpI7Ipn?=
 =?us-ascii?Q?p01MnD5Pg1NmgmcVZuFf7hsjU7+8OEph7dMLge/j/ipycoGtAN3Lxac4kaLk?=
 =?us-ascii?Q?y3k/YvTRf5hTVvZ9os6NZBRh/bUhH6ktAikUJLSjFEt+s8ajdSjHecqdx36d?=
 =?us-ascii?Q?lTllvFiwnULgDYDBI6X2kgVIcc/ExUlhKSMVBO9bXrdSi3mLGW7+YmkSmPSM?=
 =?us-ascii?Q?lEQmIW+ha3ouV7dm1aAawbyg98jWu2y6HzuQPPQ3xU8T1I1sd8sih6QTxM6N?=
 =?us-ascii?Q?dP/JTki0AcvfOtV3Iv35vzkSwQuRfRRIqD+MdG6YbJcU1a82oNRF5hIsNzBL?=
 =?us-ascii?Q?4bbpd4sXpcUpxWkGjBuJOmPg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d30571-dee1-4e7d-fe5c-08d8fa99aad7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:21:57.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfeZDrBOz0nGQjhlxoD8ZyM6bpy2tgk0NsA8xhtOh9Yh5cRjHhbYxGnMjrFN9Adkk6SQ9l3uynjbLh4QDyGryw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7058
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/8/21 4:29 AM, hongbo li wrote:
> Hi Varad,
>=20
> Varad Gautam <varad.gautam@suse.com <mailto:varad.gautam@suse.com>> =E4=
=BA=8E2021=E5=B9=B44=E6=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=
=885:20=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi Hongbo,
>>
>> On 4/7/21 10:27 AM, hongbo li wrote:
>> > Hello Varad=EF=BC=8C
>> >
>> > I also made an implementation of rsa pss: "[PATCH v3 0/4] crypto: add
>> > rsa pss support for x509".
>> > I notice your patches and did some review, =C2=A0find the following
>> > differences between our patches:
>> > 1. You rework the rsa pad framework. This is reasonable.
>> > 2. You did some changes on the keyctl and asymmetric struct. I don't
>> > see the reason.
>> > =C2=A0 =C2=A0 Because for x509 layer, it only need to know the hash pa=
ram, and
>> > could ignore other params(salt len, mgfhash).
>> > =C2=A0 =C2=A0 Let rsa-pss itself parse the pss related params. So it s=
eems we
>> > don't need to change asymmetric's
>> > =C2=A0 =C2=A0 common struct.
>>
>> A signature might be generated with a different set of params than those
>> used for signing the x509 certificate that wraps the corresponding pubke=
y.
>> In this case, using the params that came in when the pubkey was loaded,
>> instead of params for the actual signature would be incorrect. I see
>> struct public_key_signature as the right place to store such state,
>> regardless of where the signature came from (detached or selfsigned).
>>
>=20
> As what the comments in x509_note_params() =C2=A0say:
> In crypto/asymmetric_keys/x509.asn1, AlgorithmIdentifier is used three ti=
mes :
> 1. The signature AlgorithmIdentifier in TBSCertificate.
> 2. The algorithm in SubjectPublicKeyInfo
> 3. The signatureAlgorithm after tbsCertificate.
> When the pubkey was loaded, it is the third one. According to rfc5280 [1]=
,
> the third has the same value as the first one.=C2=A0 Your patch use the f=
irst, and I
> use the third, I think both are fine.
>=20

Consider the following to illustrate my point:

# Generate a key pair:
slen=3D20
mgfhash=3Dsha384
openssl req -x509 -newkey rsa:4096 -nodes -keyout private.pem -out pss-0.de=
r \
    -days 100 -outform der -config x509.genkey -sha384 -sigopt rsa_padding_=
mode:pss \
    -sigopt rsa_pss_saltlen:$slen -sigopt rsa_mgf1_md:$mgfhash

openssl x509 -in pss-0.der -inform der -pubkey -noout > public.pem

# Sign some data:
echo data > data.txt
slen=3D30
mgfhash=3Dsha256
openssl dgst -sha384 -sign private.pem -sigopt rsa_padding_mode:pss \
    -sigopt rsa_pss_saltlen:$slen -sigopt rsa_mgf1_md:$mgfhash \
    -out sig.bin data.txt

sig.bin has a different slen and mgfhash vs the signature stored in pss-0.d=
er.
Since psspad_set_pub_key() here [1] will unpack the params that correspond =
to
pss-0.der, verifying sig.bin (eg via keyctl pkey_verify) would fail.

>> For the same reason, I also prefer the parsing machinery for signature
>> params be kept in x509_cert_parser instead of unpacking a buffer in the
>> PSS akcipher's set_pub_key implementation [1]. Going that way, we also e=
nd
>> up parsing these params twice, since x509 needs to unpack the hash
>> algorithm in a pss-specific way anyway.
>>
>=20
> Yes, my patch needs to parse the params twice, my=C2=A0purpose is to make=
 small
> change to x509 layer.
>=20
>> For the IMA usecase, since x509_key_preparse() would have already filled
>> in the params in public_key_signature, asymmetric_verify should be able
>> to find and set these from key->payload before calling verify_signature(=
).
>>
>> > 3. Why reject the cert whose MGF is different from the hash function
>> > used for signature generation?
>> > =C2=A0 =C2=A0My implementation could support different hashes, so don'=
t get your point.
>>
>> The verify operation (psspad_verify_complete [3]) in theory supports it,
>> which I've tested against such certificates crafted via openssl.
>>
>> I chose to reject such certificates early on during x509 parsing since,
>> - these are not a common occurence in practice, and
>> - testing (besides via openssl) without a set of reference vectors to ha=
rden
>> =C2=A0 the verification against seemed insufficient.
>>
>> I've had some more test runs complete in the meantime, and I'll drop tha=
t
>> check in the next round.
>>
>> > 4. I add a test vector and a patch to support using rsa-pss for iam.
>> > 5. Other implementation difference, i.e. the mgf and verify functions.
>> >
>> > Maybe we could merge our patches, what's your opinion?
>> >
>>
>> Sounds good. I'll send out a v2 soon, and if you agree, the test vector =
[4]
>> and IMA [5] can go on top of it?
>=20
> Sure, Thank you.

I've posted a v2 at [2].

[1] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3051=
3-3-git-send-email-herbert.tencent@gmail.com/
[2] https://lkml.org/lkml/2021/4/8/775

Regards,
Varad

>>
>> [1] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3=
0513-3-git-send-email-herbert.tencent@gmail.com/ <https://patchwork.kernel.=
org/project/linux-crypto/patch/1617802906-30513-3-git-send-email-herbert.te=
ncent@gmail.com/>
>> [2] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3=
0513-5-git-send-email-herbert.tencent@gmail.com/ <https://patchwork.kernel.=
org/project/linux-crypto/patch/1617802906-30513-5-git-send-email-herbert.te=
ncent@gmail.com/>
>> [3] https://patchwork.kernel.org/project/linux-crypto/patch/202103302028=
29.4825-2-varad.gautam@suse.com/ <https://patchwork.kernel.org/project/linu=
x-crypto/patch/20210330202829.4825-2-varad.gautam@suse.com/>
>> [4] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3=
0513-4-git-send-email-herbert.tencent@gmail.com/ <https://patchwork.kernel.=
org/project/linux-crypto/patch/1617802906-30513-4-git-send-email-herbert.te=
ncent@gmail.com/>
>>
>> Regards,
>> Varad
>>
>> > Best regards
>> >
>=20
> [1] https://tools.ietf.org/html/rfc5280#section-4.1.1.2 <https://tools.ie=
tf.org/html/rfc5280#section-4.1.1.2>
>=20
> Best Regards
> Hongbo
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

