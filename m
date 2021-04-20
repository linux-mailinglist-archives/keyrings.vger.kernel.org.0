Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21373657D4
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhDTLqs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:46:48 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:49724 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231840AbhDTLqr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=vUlctdSoqOFNxY4UtcL4eG0wJQBPXiruH/HbQNh30Yc=;
        b=gkxK747skX/GF2UQ8cMrQiOmrMml5CY+L+eEr4uUgG3dUzHmKHsFuXz/is6L7bhfJigIPY
        gkuFED+Yzs/7ZEIgV+DYZNhwn1G9NL70zF82yTP72Pedf5DNot5U9Lwy4Su5KCNer5rBFg
        uNGaMabAzSFmJm77yabCngxWR9Cd2AM=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-6Eu8FyC_NRaIhn18VK7kfw-1; Tue, 20 Apr 2021 13:46:14 +0200
X-MC-Unique: 6Eu8FyC_NRaIhn18VK7kfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axpN/FVEdZD2wX9Z/xysdauRwvmf4zeXqSkUQflNsM9Is7qzgPJB2ElUmD9RFHz8CWfBj2+vhDFH9ZhFuk+gUUJD6F3xPmb5dZFLozyX4uvuU2BG14bKQp77IlUtlGTaIJ8npnskqr9HSSqGwhP8IIUGUzq3WIS9LshrmHF3nWmhhgv+PxIafFbu37FZmTo/NhHnqtVBR/YFwpVWLEujYCVmwqh/GksInGY6A6+ogvgx4zUzUwaZ7KzgKyGPiTYZW/rGmIjVSPv7HAVWrju8LEAlVPY+eP3CG6ADFdG4FHwSI4TErhAk1zt2XEePmwiL3W9fmRffb0u+YYNvj5E5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUELCHFtDk7kf95esCwh6IKf6RTZrtnvupTYz0cMp0A=;
 b=Mmbe9FYmP52JM9XK3akWyfWk7/t/im9R2vChjbRTmT1h3z3hGNmaYl3JDIs1ESBaIia1n407HTQ+9mHqm7LFOsxXYhVkIuoxq3UdjY6tqY/3ju4yROudNj3axWxlW+vP9ARFiJLXyrGk2FVeSfT+pVXlnji7vvX+JlVxspb/sKq3ZNK+m0ifTSW/BDrSEft9KYUz82GpHpwpSnOM6yRhfmEv3NbVZ00lZpAYE24xtnHbKbGXJrngt1brgY1M48Dcsjifa1+6GGFKQtciESOjgCTBYegLp7m1Mey0ZrPNBo6zQ3KkXhgdVB57LG5RazFD3Hj62wlXGnYdJb/T0RbSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:12 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:12 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 00/18] Implement RSASSA-PSS signature verification
Date:   Tue, 20 Apr 2021 13:41:05 +0200
Message-ID: <20210420114124.9684-1-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: PR3P189CA0083.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::28) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39023091-67a9-4d52-b479-08d903f1e566
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB515496CA16F68783D56F3FD6E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TWzBHt71YP13dP/lJ2EUmWdpXRyRqJsIaeK6P9E/zrDJX2tGoG3IfzNTE2c6VxwHXRtTfBqpgosk7zr6EOldHbdtLvGpLT5q0HGYHn2niZVWWbzuck83MXB1pawfMVNYW9kFrW5mrXmYgc0WHETnzpc+7n4oA7z9boQM1aD00xJW15s4sIDxYBSTpe7k+aqou0r1dQIQukty1gPhcfAz7PAq4AaXO+EQNbkwDeRfGrmrm/hg4boTBaGQVFor1KW/joPudBUnz4SFRL6YcVULmTivAU9aqI0lz1an9ebK+s0gdAdgNSoLZG6iHmrveoI5gu0a0lUcBjqCh9zEEnJELeIN7VhxY4uktmLiKKUF9jwDd4sTKDMO6K4KZpIH6MM32XI1xcEv1duuAPmcu5si/vhs6JKWtuYMdV14qChm0diopKU7FpAszN0+fUkVjYfGSTNErSPvvXggW9N+6/0dXxLqc0fg2/pTO9ayiEO9ZpNqZhDJsONopS/9gzabB4pCpLBLFmqNcr3kDe7A5jT8ICxT+i6YQvykic6xyQ0Z5Z9JndTDoBHPFW+bxdtbDLIMBBW0TfMguRrbgbN8qJBjtXgK9LmLFDgylacVQdGlLNu9lTrNfclUD689HWI+O2hxk5pRAhOSyEUh092kqmYp/RUlTieVgAFagUsA78vVHK9IeBEP2tR7tiHkU0I6exTw2zBnBuZXPxj6WdRQh/fSdofyHTpt5Jp93GXK9hw7qiiHHl1YU36jWZfghbLgRQz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(15650500001)(26005)(966005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FS2kB7mtwEPbNil+3PT0CELw93+6hLvJirk7yBB6hTWF784la0CSezerMRsM?=
 =?us-ascii?Q?W1nUZ4uvWfUDpxgBviW9W2aPFWBSY768u/aOGnNQ9i8euKrEsjFoGRue1LMK?=
 =?us-ascii?Q?YcAcxWeJOy6sD/JLlqM2lMrFvakyx7+y3qxHYKmKJ4ESunS+MrVM08M5P9Dj?=
 =?us-ascii?Q?JfCaonL7EhHBUWEVJUL4bLvt3V6IY7DWhahCsXvag4lNwjj7YotxjqZxISXj?=
 =?us-ascii?Q?IcFivk102RDBG8jjcIMV3wieSNRiOcn+ujtcUSTkK3ugWdvx6UUb4SzJ7gBR?=
 =?us-ascii?Q?mOHw5Xs0MNKMrWRlwJ4punOCzFbSrXP7bsunrpL6GewdoKx1pRo14v55B24m?=
 =?us-ascii?Q?uEyrBknfyGDv//En/qWWcG+Wl0Dnf3q3WtTLLLTS8y/ZFOVGWPtrvk3LJYe1?=
 =?us-ascii?Q?egkOFclGknn8jz8lZGzmBVgZ6m3X2Mp9kxgsqa0D6b8r19np+gX3ReetZiW5?=
 =?us-ascii?Q?6V5JEri8xytD7esKhHt6YjDdHzMiBKpX6ulB72cc/s5fqvkQ5eNXbnUTUTXb?=
 =?us-ascii?Q?fPl7Gnwk+kqVpYEXBiicDH4sV29y5c0VmGVamXrpbjV8m6OM9UW0p6RKMqNX?=
 =?us-ascii?Q?S0trkncYKbD5ae38cSQrJStfuGs160AcWQ7wNSyMP5KeQytcytT5klGyTyLk?=
 =?us-ascii?Q?n9MQRnneHT1UrUZUoSebrOeerSMZpm+4um/xYVqnt/H5a8pXkcrY79q8B+eV?=
 =?us-ascii?Q?TSS4LiQD980kXxULfK+AlW2BrjIChIH32rl+x3VSQpJKoVirpl6RKSkcz/qH?=
 =?us-ascii?Q?7G7EPMgl+Ifr3SiNuoQkqFeyCN4FTYBQCLUuWUI6EhgDKxOJX56GsZ7dUNlH?=
 =?us-ascii?Q?ntuCQnBLUCTPac7Wjo9Qs+12b3qFZHv4OPtK0+XlM2hkOlvRr7ZBc0rbmw1Q?=
 =?us-ascii?Q?9bBbBW9KaHOTtN+kDouLMgdIdPcI1DUbsr9XNqsw1T2dhPr97v33sVTH9sjL?=
 =?us-ascii?Q?0P6XdO0altlfv7g+6fhR4Rw9busdq5VoWW5zWWUHjpiVTSOuHu7p9hlGWzVD?=
 =?us-ascii?Q?/zGRuykiD4eTEymfc6JzwL4y0bG/NvbMCIzZnvbsE4+UUIEsSu9Uk1r38cNY?=
 =?us-ascii?Q?nHZ10uxUG9thDeMjAKVC+qH/DqpKkIUpjuHl8X1DAHB5GtIgW59Q3r4FaP0w?=
 =?us-ascii?Q?jc+SbC5iys7W9+9CvwLls9ETXhZZU5iUNFrvyVFAIX7N92jqXNgx/P2qKBlz?=
 =?us-ascii?Q?gcOrJTJftjccDbYHqELLoA5+5vBxVnWY8Heh3ipsKgfAQN5SapPa8gV2/qkC?=
 =?us-ascii?Q?i92jior5F9wZ65+8DqNkqQvjrjny9kLumpGXWR/vcD6ecVvvN9RaNFJrKddW?=
 =?us-ascii?Q?21Ews/2HE75AT2F4UkkONvMK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39023091-67a9-4d52-b479-08d903f1e566
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:12.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU5fO0Qi1JvzQ4mUcRxtvnb6+vmgWrTgbN/wEeeRxldOEACYlfZkjYcTEMyzU9sgeAcAIU3bdMCMuu1CQf57BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
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
    sig.bin "enc=3Dpss hash=3D${hash_algo} saltlen=3D${saltlen} mgfhash=3D$=
{hash_algo}"

v3:
- Rename pkey_verify parameter for salt length to "saltlen".
- Update Documentation/security/keys/core.rst.
- Add validation for the hash algorithm passed to psspad_setup_shash.

v2:
- Allow certificates where mgf hash algorithm is different from the digest =
hash
  algorithm.
- Fix sparse warnings on "X.509: Parse RSASSA-PSS style certificates".

https://lore.kernel.org/lkml/20210408141516.11369-1-varad.gautam@suse.com/
https://github.com/varadgautam/kernel/tree/rsassa-psspad-v2

v1 is available at:
https://lore.kernel.org/lkml/20210330202829.4825-1-varad.gautam@suse.com/
https://github.com/varadgautam/kernel/tree/rsassa-psspad

[1] https://tools.ietf.org/html/rfc8017#section-8.1
[2] https://github.com/varadgautam/kernel/tree/rsassa-psspad-v3
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
  crypto: rsa-psspad: Get signature parameters from a given signature
  crypto: Implement MGF1 Mask Generation Function for RSASSA-PSS
  crypto: rsa-psspad: Provide PSS signature verify operation
  crypto: rsa-psspad: Implement signature verify callback
  crypto: Accept pss as valid encoding during signature verification
  keyctl_pkey: Add pkey parameters slen and mgfhash for PSS

 Documentation/security/keys/core.rst      |  14 +-
 crypto/Kconfig                            |   6 +
 crypto/Makefile                           |   2 +
 crypto/asymmetric_keys/Makefile           |   5 +-
 crypto/asymmetric_keys/asymmetric_type.c  |   2 +
 crypto/asymmetric_keys/public_key.c       |  18 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 148 ++++++++
 crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +
 crypto/rsa-common.c                       | 291 ++++++++++++++++
 crypto/rsa-pkcs1pad.c                     | 400 +++-------------------
 crypto/rsa-psspad.c                       | 310 +++++++++++++++++
 crypto/rsa.c                              |  26 +-
 include/crypto/akcipher.h                 |  26 ++
 include/crypto/internal/rsa-common.h      |  61 ++++
 include/crypto/internal/rsa.h             |  10 +
 include/crypto/public_key.h               |   4 +
 include/linux/keyctl.h                    |   2 +
 include/linux/oid_registry.h              |   3 +
 security/keys/keyctl_pkey.c               |  13 +
 19 files changed, 993 insertions(+), 365 deletions(-)
 create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1
 create mode 100644 crypto/rsa-common.c
 create mode 100644 crypto/rsa-psspad.c
 create mode 100644 include/crypto/internal/rsa-common.h

--=20
2.30.2

