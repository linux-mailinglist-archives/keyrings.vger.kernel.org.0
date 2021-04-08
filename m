Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1081B3586B1
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhDHOQQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:16 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:36225 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231771AbhDHOQP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=U+66rZDJkENP+Zr94SasM8SHU7cYH+u1mbpuyg7quVY=;
        b=J0P96qz0aIKtYt3C9cLtMjQ0jgD2s4yaTCjKtYrt1sNul7CmS2ECKjMK4/4yM45+9Y/NCb
        MjwlTR9nyNKPK/fUylUzvtmF7HLNFGXqzZKae4XaMqe7EX6USxs16PwFQKjIRwxtkTUzCx
        hvGu19/x+gc4XLPW7unlO5Etljl+JaU=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-yPOMPddiMtebMMQgqAfaWQ-1; Thu, 08 Apr 2021 16:15:52 +0200
X-MC-Unique: yPOMPddiMtebMMQgqAfaWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmzKh7ORtJrMHRjSQYahPv9g3zHPYxRurmrlVLEibuY2UZ8N0g/pLrWAFxnOpyidIPjt46/vJ89CvHmJJxdayNCT+TGsx5mARE1HsU66qXa6WbdsUFBku3FPl2WY1rDPXU1sGizxTk0yKFdDNQF7QPIjRb7Uk1NUQ9/FKRkGuW5EtF7+/2xHm0PExm0MwhVY8G0bAoZvvcTK83PrHjhz7gUu4iN5GMGPVHz6KMux3AmQ8mNoUdY2fi/jNEI26N0XMIrvatfEhRy5voZL63UeQScPOI46YbkqE9P1ckflHZskRC+e9/4IzMc3VugCfdtvBW83JHP5lIXMFeLOfQs9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrZAY9Qe3OePPGzYBFr4n07gkP/jxuODxSr2ehP8S8I=;
 b=aE2jQNy5VJuQwoWNB+EnM7W3voxrmPHjd5dqCeHcJvKsZHU6Sb1rauGPDpQnNAy5u770L3/1cLQrD8aE0fTTrJCx0s1Brv4E/AXpWy37Aq3rNu5a+L7IKNBDwXCinHvgX3yiZhYrq/GEyhRnMQT5mnh1fBitJT3Lf3zy0malGX1lsxVm8QhdsK3E7EUezQgSII/vjA6PLPusjaI8LIdn0ZhkWysML8yJtEGbGuHJmPyQ2UhL9zcEP8U4H8+hc2QWFdbqBXXisxjZvRfFtW9XRAJMaXRH/0IGL3SqXhntOLVWB7e73Rr+wZwwF5On9wxPKOIdJI8Oh4ELOBCeiSDawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4338.eurprd04.prod.outlook.com (2603:10a6:208:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:15:50 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:15:50 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 00/18] Implement RSASSA-PSS signature verification
Date:   Thu,  8 Apr 2021 16:14:58 +0200
Message-ID: <20210408141516.11369-1-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:15:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2621940a-3a92-4bd9-406c-08d8fa98cffb
X-MS-TrafficTypeDiagnostic: AM0PR04MB4338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB43389BCDECA7299D95C23390E0749@AM0PR04MB4338.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Ipd9Mz002GAcWp5CMmUDwOTct94K23YJWd/vFlwTnjPBiWpeoH1LiqZvTGLvzpHlDOqlLTlkQbo6v5gFOyV9mGBIT+3LtqEehsllQqR/lG+Hm3mx6quiP59jSo18nMYfBmq8ihEGznA442QKplnt6NX2ffJFE7XCsiECNUZ8KKgTOyw/r34rlsl7V5/AIqj8SsXYg7opVKlsDS65z2KRl9WQtLlLe/077mQ5e9JvbKujllQraHJ9BD40xeOqLQz4GpS0LO3GsfdFtfw/ZEfPJPMO5vbAbmKz+EEpeWod1LbsDrsKOXQ1WkdT2sqFMGYs8da1BY/XFzNujpOz+fuDdtvpyxpoDcccF8Qti529n9K4jsWgQqIp/YvLOS4BClSG5PrylLSSZAICLQwn90sZO2gHljYVRPmxM5/+kW7oUMKRk+x5kACNTsB972W4PvNH+4P41qhCGRPX7msEVHqlR7bX/+i0ImerP0y8ANCG9/QbwpeUyxRZqpRXdYVZTOEANpR8eaZA6gXgtrm44kWQauGvdZTq+NkaChHOKev7gEk1xjYSqedmHq4niYiQZ+uuDZDmvLqW31qTseohBNeEzhMRSBDiCgeBk9AIzw00H8nobHXdXddZsN9ZGcdS5PFwkvnpeOD2qjkKl0nMWjlLFRlKh2eQFab0YhMRM7V2ygfU74cUy9Hutu91AFBKFiUp7sFaeZSu/VIDC3p8vTcDcuMMKt1cVfVgq3BtnMlf8z+pNL3aDZ2DRfrKD/qOp3utEkBVxvgSMWpJ9HtbLM0PBMa2ktQahaL9SEjJL9Zcjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(38350700001)(6666004)(2616005)(966005)(36756003)(66556008)(316002)(66946007)(1076003)(6916009)(86362001)(6512007)(66476007)(44832011)(8936002)(956004)(8676002)(6506007)(2906002)(52116002)(38100700001)(15650500001)(186003)(83380400001)(478600001)(16526019)(5660300002)(4326008)(26005)(6486002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s0RDL9uxGC8z/E77fPG3YfSdI5QngaS6Qta2r/AUMCMsi0PV3/BP/Smlwao1?=
 =?us-ascii?Q?wGVnZGxkHjRLYDb+GfX7yCf/PcQnRIpj5GONJzUcSmj+OnRVevPB4CP6Ww2g?=
 =?us-ascii?Q?+m0bTz63O8gTQjWgrBts+tpnC+eaMMb5zdMdE5nXOtz4MdC+zxdl7urHAt7M?=
 =?us-ascii?Q?JfnnvRZyvwdJfBCQuI0vu+KkgbGaLyQDywSNiK1Vyaa2fe+saPlnh8QUichv?=
 =?us-ascii?Q?Z72z6Rv0AMOMoEwAuDQF33PNkcgr5qhwFvgr/eejCDtjhFPVrOvxfp9psD3j?=
 =?us-ascii?Q?KlO0HeAICodN8dqCW12QcVJWpVdT32izqWNjxcqb3iaFAB6GfXwvHAn4pHwG?=
 =?us-ascii?Q?aLcNZ8xozDnRvjryVrudWoxy2At66+y/S0JnsX3LbR5wItWVPmhnMNvXbuHY?=
 =?us-ascii?Q?WyYOqf9MPtVDjF749XnqY0X+1G1IcK31aN78/jDkiIYwf25uA0bvYreya3/w?=
 =?us-ascii?Q?Y01lANDmph3IDG0vNYYEvlTndOsPGhpkLZpKtJ2A2TnbGkP018LiuDapVDhK?=
 =?us-ascii?Q?bcsO/qKQgXxTPSx88rMw0BONDxN2gf/uPZTNCZy/lK12XXa2qVwj/2RUH6hf?=
 =?us-ascii?Q?QHR1jnJL7plboTBRgtV5OL54VIT5pmlVKTsZYVbIo+L66BfAv20zyS3BnmdW?=
 =?us-ascii?Q?22mTuGTI8JMg0Gn9I/HakIeUq4VRH2emeLc8MyH7EaWasQRWDG+wHiWjY48i?=
 =?us-ascii?Q?NkB952dLaN8ImrBW3Yzm/QVJHoR0irtTuRljCBduCC+hiPYoJNM/79PZZEtQ?=
 =?us-ascii?Q?JrYBNOAVNjuBwxe/ChNjHimjwnLwFQOTpv+BpGJg6c/ioM/uLB6cW0ARW/+y?=
 =?us-ascii?Q?5E/HrlTVPWmdZLtz2E15HI+3hY4iPJ2Y9kX2BzNAh912Rc/mlFIWsuqck2z0?=
 =?us-ascii?Q?mb24QtLZ4j4uUt/pdU584zJsmrXLVVMuAq2xffPM1Sa5ZvXCay98cXpgRrex?=
 =?us-ascii?Q?nA40eXlDJef/YrIr2V8SMYP+oA6Rh2Y3jAwBNTTa4mZ3wSKKXdpzhy6rDWLI?=
 =?us-ascii?Q?LG+Ek5Q1hcKOXq/E2thpkPrzvHsaIuJBYYjDxCF2QRY+EHtdmR6kC2it+sqa?=
 =?us-ascii?Q?QK3wx6T8ErAu/jAPPUeKCHKjc70F2eBKUfZJPdK/vrhwxSqUWcTg/nWLFCeI?=
 =?us-ascii?Q?Y8ppjpQUXSHkxo32+neemW6r+3PyTLNcMyivbDYR1z9fWmtvOJRs3ObHnvbi?=
 =?us-ascii?Q?JLRWjqsGi2PmbVlVpSsHmJLq3n0ZnjWXS/ONnlwOF4Ae9hnS8zO3QtAjF8A6?=
 =?us-ascii?Q?lH/Ux4zrf2NFGDkDRA0tG082UDu9t6+KFYK6gHSEWok/StjHEJQ1zFXG6Eri?=
 =?us-ascii?Q?CNyH5TJNkJDYhmYj3B/orVCh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2621940a-3a92-4bd9-406c-08d8fa98cffb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:15:50.7665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He4Ejz7AbfgBzfLxLsUaDEpoVwTFduVFmBdabeUjJpcOztMbj7W/MTqMtQkipZNDKrD4ECnODMFdHd5gguFqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4338
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linux currently supports RSA PKCSv1.5 encoding scheme for
signing / verification. This adds support for RSASSA PSS signature
verification as described in RFC8017 [1].

Patch 1 extends the x509 certificate parser to unpack PSS signature
  parameters.
Patches 2-8 pull out the common functions / struct definitions from
  rsa-pkcs1pad.c into rsa-common.c, to be shared across RSA encoding
  scheme implementations.
Patches 9, 10 provide some more plumbing to export the data needed to
  perform PSS operations (salt length, RSA modulus).
Patches 11-16 set up PSS scaffolding and provide the verification
  operation per RFC8017.
Patches 17, 18 turn the final knobs on to allow lowering PSS signatures
  for verification via keyctl.

The patchset is available as a git tree at [2].

Testing:
The implementation was tested by adding reference public keys to the
kernel's keyring via `keyctl padd` and then verifying a known
message digest / signature against this public key via `keyctl pkey_verify`=
.
The reference vectors were taken from:
- the Wycheproof testsuite [3]
- FIPS 186-2 and 186-4 test vectors [4]

The test harness is available at [5].

Example keyctl usage for PSS verification:
rsa_bits=3D4096 # 2048/3072/4096
hash_algo=3Dsha256 # sha1/sha224/sha256/sha384/sha512
saltlen=3D32
# Generate keys, certificate:
openssl req -x509 -newkey rsa:$rsa_bits -nodes -keyout private.pem -out cer=
t.der \
  -days 100 -outform der -$hash_algo -sigopt rsa_padding_mode:pss \
  -sigopt rsa_pss_saltlen:$saltlen -sigopt rsa_mgf1_md:$hash_algo

# Sign data.txt:
openssl dgst -${hash_algo} -sign private.pem -sigopt rsa_padding_mode:pss \
  -sigopt rsa_pss_saltlen:${saltlen} -out sig.bin data.txt

# Digest data.txt:
openssl dgst -${hash_algo} -binary -out data.${hash_algo}.raw data.txt

# Load pubkey into the kernel's keyring:
kv=3D$(keyctl padd asymmetric "test-key" @u < cert.der)

# Verify with `enc=3Dpss`:
keyctl pkey_verify $kv "0" data.${hash_algo}.raw \
    sig.bin "enc=3Dpss hash=3D${hash_algo} slen=3D${saltlen} mgfhash=3D${ha=
sh_algo}"

v2:
- Allow certificates where mgf hash algorithm is different from the digest =
hash
  algorithm.
- Fix sparse warnings on "X.509: Parse RSASSA-PSS style certificates".

v1 is available at [6][7].

[1] https://tools.ietf.org/html/rfc8017#section-8.1
[2] https://github.com/varadgautam/kernel/tree/rsassa-psspad-v2
[3] https://github.com/google/wycheproof/blob/master/testvectors/
[4] https://csrc.nist.gov/projects/cryptographic-algorithm-validation-progr=
am/digital-signatures#rsavs
[5] https://github.com/varadgautam/keyctl-rsa-tests
[6] https://lore.kernel.org/lkml/20210330202829.4825-1-varad.gautam@suse.co=
m/
[7] https://github.com/varadgautam/kernel/tree/rsassa-psspad

Varad Gautam (18):
  X.509: Parse RSASSA-PSS style certificates
  crypto: rsa-pkcs1pad: Rename pkcs1pad-specific functions to rsapad
  crypto: rsa-pkcs1pad: Extract pkcs1pad_create into a generic helper
  crypto: rsa-pkcs1pad: Pull out child req processing code into helpers
  crypto: rsa-pkcs1pad: Rename pkcs1pad_* structs to rsapad_*
  crypto: rsa: Start moving RSA common code to rsa-common
  crypto: rsa: Move more common code to rsa-common
  crypto: rsa: Move rsapad_akcipher_setup_child and callback to
    rsa-common
  crypto: Extend akcipher API to pass signature parameters
  crypto: rsa: Move struct rsa_mpi_key definition to rsa.h
  crypto: Scaffolding for RSA-PSS signature style
  crypto: rsa-psspad: Introduce shash alloc/dealloc helpers
  crypto: rsa-psspad: Get signature parameters from a given signature
  crypto: Implement MGF1 Mask Generation Function for RSASSA-PSS
  crypto: rsa-psspad: Provide PSS signature verify operation
  crypto: rsa-psspad: Implement signature verify callback
  crypto: Accept pss as valid encoding during signature verification
  keyctl_pkey: Add pkey parameters slen and mgfhash for PSS

 crypto/Kconfig                            |   6 +
 crypto/Makefile                           |   2 +
 crypto/asymmetric_keys/Makefile           |   5 +-
 crypto/asymmetric_keys/asymmetric_type.c  |   2 +
 crypto/asymmetric_keys/public_key.c       |  18 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 148 ++++++++
 crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +
 crypto/rsa-common.c                       | 291 ++++++++++++++++
 crypto/rsa-pkcs1pad.c                     | 400 +++-------------------
 crypto/rsa-psspad.c                       | 291 ++++++++++++++++
 crypto/rsa.c                              |  26 +-
 include/crypto/akcipher.h                 |  26 ++
 include/crypto/internal/rsa-common.h      |  61 ++++
 include/crypto/internal/rsa.h             |  10 +
 include/crypto/public_key.h               |   4 +
 include/linux/keyctl.h                    |   2 +
 include/linux/oid_registry.h              |   3 +
 security/keys/keyctl_pkey.c               |  13 +
 18 files changed, 961 insertions(+), 364 deletions(-)
 create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1
 create mode 100644 crypto/rsa-common.c
 create mode 100644 crypto/rsa-psspad.c
 create mode 100644 include/crypto/internal/rsa-common.h

--=20
2.30.2

