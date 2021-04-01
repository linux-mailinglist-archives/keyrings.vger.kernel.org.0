Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2F2351021
	for <lists+keyrings@lfdr.de>; Thu,  1 Apr 2021 09:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhDAHdY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Apr 2021 03:33:24 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:30785 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233383AbhDAHdH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Apr 2021 03:33:07 -0400
X-Greylist: delayed 126194 seconds by postgrey-1.27 at vger.kernel.org; Thu, 01 Apr 2021 03:33:07 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617262385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=AsBtWOxjVDz2gH38NMvpAo8e1pNHJ51lRkga+dJ2MMg=;
        b=YniarM2JWEHPhVxJ03yw07JI1JoUqkeadzRN0GiglsdXbqlNlvWpXICDHcdehBgSBPJEio
        HFYhmFDnHu5gl6A9u6Zi/mvjUc47TARD657DoUPOikiCJzyqU/+Vp9Wtyj60GYzCLDKBr4
        s6LmAQY0RbRLqpMr4FtL6eHo3yvdzGg=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-G4lYijwIMSWi70oravzPtQ-1;
 Thu, 01 Apr 2021 09:33:04 +0200
X-MC-Unique: G4lYijwIMSWi70oravzPtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHq2MaRJvBI/lxl2vh1EfaRSywu92QJ+MJ8VWTW4hknmdNJwYBJ2TvTXSADzUOnYxfnPlWWjsgTwiHr8DssufnFAMVg9MNeZkm1C16Z4r53dsBBIPfEz7Z4qeTTU/GzBrbsR+76bxoWUIYz4xL1hyjM4NHFV2w0GbTHJCsth4x6CzX2aDiNfpgl9tLmBwlimA3LEhOamxxSzHlWes3BDFTrF93Nvcb9NZnn7l+1n3oYBe2vzSo7+qjlvnLJd6BxjIUVeJMUZjfnExdCURl5Ib1LZjNL0Z812i9OMcvxzxusqCLADnEn48g/UrfRxtMxFLD2yZMecQOvHMk6bJbEUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE3Dfo2oa2yW8C7yCeHVYIucFzmvv4WzdRfqQVSxKUE=;
 b=WNPIQY1kO18Jah7GX9LF/A1wiPOF1zc9LPF4mE2lc9NoNg+nIx783ifPHb7lzupNzoiKXS0T+AlRJNs+J/5cDnxfAhSNJqMW5HRQGxgOBap+D/F837I0vTMU8prDNBNY3Vo2zul/vrzs3+TCBwzGN/OxXFR7S/NRsrdB1W3poeZP6yBdsOI2NtW1M5K75HoFyqjj8yEPUBkcaO/LjaUpEFGtNs9NkjByHV2KLLkNOv3VM2SprvtBptcxFtyNS+lOQGdFHq4zpMyDaB/FUc1bAbgF5CXJY9f46HZLSI+VjXxQ8ONoWtrmfDJMZ4vfpZ7H3R7PW8uwx9Wg3si+1VdaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5155.eurprd04.prod.outlook.com (2603:10a6:208:ca::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 1 Apr
 2021 07:33:02 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679%3]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 07:33:02 +0000
From:   Varad Gautam <varad.gautam@suse.com>
CC:     Varad Gautam <varad.gautam@suse.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 00/18] Implement RSASSA-PSS signature verification
Date:   Thu,  1 Apr 2021 09:31:52 +0200
Message-ID: <20210330202829.4825-1-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.de (95.90.93.216) by FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend Transport; Thu, 1 Apr 2021 07:33:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6b1237c-2997-43f1-6eee-08d8f4e061c2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5155:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5155374E44959C6088CB7538E07B9@AM0PR04MB5155.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LeVbkB4SKKFlpBz7EDLBi0idxvUhSRCIMwZbP4NqYesNqIVRDncwb2qh6BnyYIZ+rHJgPzJtX7Tdl+L1dYMDb2JDDZ391U/WlRicUPecNhNV10AwAVJ1IyYAoDqKvc5tH09KBS1YsuaDc1RcojCpVOiEC3009GCIQsajPNUUNSjiCNTW/M+dKAyeReV0Ixp9/Y3fcVkw2btb4hNCmdFn9iOczfPAd7BRtOCSnmhEIs7fW10dzenaZqkVwj8dyuCgq8loHUWrIDtHidlKEiW7ax2hAd5lDvPIGnJFUpnAxw1RnQB2KS2mbKIW3uD3ij+R0MyhgBONtzvdMhurBw67mWLVDCYu/AGQoZ24iXW0xDXW2e4yGM8htQQRuUslpETJmvQTmQY9BY1+cb4JyU5S3+WSJYFV3n2MxYAyl5tGRapUTC8zr75X4tfheu0Ls0z/MESpI37xAJNWGL6Ep1qf+ErgU2OUCAFUuS07BLoJdZHCenXWoCra0vXxDgfyv1q+Xde5nNF7WEFscdmAW6S8byCjjMqwQcp32+hcNpdquKHRajsH59Kj0kTM9zCeiKK/+t4nAoSer539dJ3TW7XrcT7OtELpU9c+yeuczKOkODBmPfnMAt7y6AU43WyOAY4/ppqoM0sDKgltFUkdww6tmHVsOr1E/jOlMOKcTsOZY+f4okNOcU/D/NhR+eTaTcQGwQ6kNM4GlJuaavOMiEqjH4rFbCr7rRjjQqkVPr6XgfefslbO0bNUbmiQGwQhDr8B+ezOWWChl83jr/FRE2AqjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(346002)(396003)(376002)(136003)(8676002)(478600001)(6512007)(6486002)(66556008)(966005)(6666004)(38100700001)(44832011)(15650500001)(54906003)(5660300002)(16526019)(86362001)(1076003)(186003)(8936002)(2906002)(66476007)(36756003)(83380400001)(26005)(956004)(109986005)(4326008)(316002)(6506007)(52116002)(66946007)(2616005)(266003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o0PC49l693t6tRKYMRDzryepGAz+g2/UihdiV+9x5Z/yWarjk0ep5YPTc+Vs?=
 =?us-ascii?Q?CUAVZDUlrL+QhcNANxTOjm4cLWcn7EWYqiAwwYrfwdVU4A9DuxwqRJDJw81S?=
 =?us-ascii?Q?uurNlMPPTzCmB2hpCylei2L2Ja0X5lSSrxMaiYGXsLlpvoFakQudXwlCor81?=
 =?us-ascii?Q?bIMd8K88oLNIoBjIlaITCnhBSve4PKTOqbZnJYcA6zfFdloRF6DoK8YR+fAl?=
 =?us-ascii?Q?zl5zdUkel4VDdeCyz7zT1Hs5tndg63U8UCIfd3A4nwDD4u2TlJsKisTQI8PO?=
 =?us-ascii?Q?jvKMDE125RtX85Q/f5wIFwGOaak9cb8eXwUjrSkrRc8X8a6cfmyxxFt+2Lnq?=
 =?us-ascii?Q?ncmOC5OMdl/qbgeMHuagigKx90lrlhwG/3xH/G6iPKQMdObYM/4wMkhpz6nz?=
 =?us-ascii?Q?ncnCKO5zH6cnTILIuzA/ihi5HM2FZm9z7pde3fonKZ/bxSujqLY3Cj2thJ0/?=
 =?us-ascii?Q?JxHl06y022nsdaOcrtbWiLQSkVO+9+WAboKsP1O53VQCDD1DwL2dr1sp08rP?=
 =?us-ascii?Q?0KVtdUetMwubAzovVcY91Dq3q6BaQg0gc0JoILoIyHg9lh1FNeB+mNC6gbT2?=
 =?us-ascii?Q?eMIFuGRV/K8x47lRDDN2zAGgdcvEoGtBK4WCS8GyR4qGPkIcQKOsMpNPU1he?=
 =?us-ascii?Q?EF8ZSust3F1HT1QuHB8SB9Jp7jnThbpG3+GDI/aadcBK2LQ13mMHO5BOsxCr?=
 =?us-ascii?Q?c23EHtUYUzIXfJSi/oZ22WJXpl8odcXsQ4PANaNLgJrTu01rR1tEjxvYb12/?=
 =?us-ascii?Q?JsWR/D4Im3EoSlAtmvKhJksqvrZKjVEmuyaPIVHxqUkGdNpqlOa6L1md6JVN?=
 =?us-ascii?Q?Sw3QfPIoZArrbBJ5nc/aIlPsfTNh9S6YWJOW2UZxdsDGSCtBRdG/hjQllcUb?=
 =?us-ascii?Q?4ij4pw9KFqDEmC7boEtRGQSwN7fZx899o/CCEGtjvYXxe+rJ5ROZJmsyweoC?=
 =?us-ascii?Q?HQbeYWxOa5xxnNJAckKDRmuLOHP2dOOP3MRiSIwRpM6rTfr1HiSOs2FEU4Og?=
 =?us-ascii?Q?XW0rujGvVg8qDsdqAcF8tsF2YH43ADZy+QpGdukYGNcJZQHWJ/muO66RlTdv?=
 =?us-ascii?Q?Jnq6Z/HoF8I3uOIMwq9V7+53EMTqRKBm0qmlRuOUS1HmUzJugkjO7yZUMBGs?=
 =?us-ascii?Q?NOYURO8ov/hdQfVXt6S12K4Kka4yHPzd4UmEKULEbRltB7GNtVDHi402NPpt?=
 =?us-ascii?Q?ug6k2no+vStM7yDLAueU/vHfqGUuXWoXd292YSh0RO4voZgaWZK2I1tiFdDz?=
 =?us-ascii?Q?IQNjVeba4pbKlW0oXHzWys1ZLjD91z+MGfNZLNb3PRvHu+DPyyZnI5CUzQT8?=
 =?us-ascii?Q?k66rLFG/8ABZyBkPGIEOBQ+3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b1237c-2997-43f1-6eee-08d8f4e061c2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 07:33:02.4268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6ZNBxmY2jmsOMJZrTFlBrVEwt/MNvAAHqwZAOi7JJP5Te3T17Baa1kmpFRCE/WCFCEM9tnLo+3jVH51kVo1kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5155
To:     unlisted-recipients:; (no To-header on input)
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
keyctl pkey_verify $kv "0" data.${hash_algo}.raw sig.bin "enc=3Dpss hash=3D=
${hash_algo} slen=3D${saltlen}"

[1] https://tools.ietf.org/html/rfc8017#section-8.1
[2] https://github.com/varadgautam/kernel/tree/rsassa-psspad
[3] https://github.com/google/wycheproof/blob/master/testvectors/
[4] https://csrc.nist.gov/projects/cryptographic-algorithm-validation-progr=
am/digital-signatures#rsavs
[5] https://github.com/varadgautam/keyctl-rsa-tests

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
  crypto: rsa-psspad: Get signature salt length from a given signature
  crypto: Implement MGF1 Mask Generation Function for RSASSA-PSS
  crypto: rsa-psspad: Provide PSS signature verify operation
  crypto: rsa-psspad: Implement signature verify callback
  crypto: Accept pss as valid encoding during signature verification
  keyctl_pkey: Add pkey parameter slen to pass in PSS salt length

 crypto/Kconfig                            |   6 +
 crypto/Makefile                           |   2 +
 crypto/asymmetric_keys/Makefile           |   5 +-
 crypto/asymmetric_keys/asymmetric_type.c  |   1 +
 crypto/asymmetric_keys/public_key.c       |  18 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 152 ++++++++
 crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +
 crypto/rsa-common.c                       | 291 ++++++++++++++++
 crypto/rsa-pkcs1pad.c                     | 400 +++-------------------
 crypto/rsa-psspad.c                       | 283 +++++++++++++++
 crypto/rsa.c                              |  26 +-
 include/crypto/akcipher.h                 |  26 ++
 include/crypto/internal/rsa-common.h      |  60 ++++
 include/crypto/internal/rsa.h             |   8 +
 include/crypto/public_key.h               |   4 +
 include/linux/keyctl.h                    |   1 +
 include/linux/oid_registry.h              |   3 +
 security/keys/keyctl_pkey.c               |   6 +
 18 files changed, 945 insertions(+), 364 deletions(-)
 create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1
 create mode 100644 crypto/rsa-common.c
 create mode 100644 crypto/rsa-psspad.c
 create mode 100644 include/crypto/internal/rsa-common.h

--=20
2.30.2

