Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76101D800D
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgERR1N (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERR1M (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:12 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730D0C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q8so3446627pfu.5
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7lIUEIbXCv4WY2urpGA/afufHRdXvAHmErENp7idJzc=;
        b=a1vrIAHbIFp8MK4eqdXfhjQxyUU9NgwR1L5IS+JCZz0NEzyl9RV3ip4Q0soGru/NN1
         XOMwCi6G/XBzJDf0jxUYoFD+PQdrTnt//bBFYjl4mA0VolHiYLAAnVms35GeLx3u/3kz
         qpGuegrhllhiBBxxfCfGWAUOvrC+TWwp9/nYtCZHvCd13lDo5HwzYeK4KU3baWpZZgkq
         RvPkVafaMsJ24HFlKUflKBJS5k+Rv+mbvlO4Cln8tvQ6oKn/Bc+ZBTk1N4y/+9wScUQ7
         LSCmcxWeuhhdJBK4SBsw0WMcq9NRMCZ6sLdptq9rT2BlLiRizWWjCBsyQE1BXx6+QmE+
         dBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7lIUEIbXCv4WY2urpGA/afufHRdXvAHmErENp7idJzc=;
        b=d0rBcXZ3ExZZXpkLgxf9+uHq2BN0jNuuBtAsZapPE2Zjnv0yYzr3BwqrPuaLUnpJ0n
         0o1plsrggbs7MoOSo/R5iQepnWqzxHuWsCE0WXZ5GzrpxhvSMrg6EWKUtOkImjRrenl1
         PqJ6g5zsdaG3Txb5TGAG5CUdFCkDigWh4MWv6ahDUsu697q/9yb9vM8RrgiKDJBlQZDb
         Ji6AChF9+DypCrmbWvU5saxHLqxk3S2NirlHHSWNc1/jF7kM+bfMTSZa1hR29J7Bx/qi
         iYz6ED69tU8sLStX1LZXg7akEgRJ6N95M1WwCKEnPojj/PujLlpV8zEWjBd7AamV+RsB
         R40Q==
X-Gm-Message-State: AOAM531OpWHMPsrGU/stMLQ9nWE0o2bw/yyvvLYURno85g8rDxo19LQ4
        aF5mRk2wPhU0NiJOP5QW372Yx9iHVSE=
X-Google-Smtp-Source: ABdhPJy8v/gc1wdhMNQffphOkISo55DO8/QMjCiqF+Qym1SxJ993ynQYYPRTuORfX7YnLGvp5+Iv2w==
X-Received: by 2002:a63:1845:: with SMTP id 5mr15820479pgy.69.1589822831500;
        Mon, 18 May 2020 10:27:11 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:10 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        James Prestwood <prestwoj@gmail.com>
Subject: [PATCH 00/17] Asymmetric key operations on TPM2
Date:   Mon, 18 May 2020 10:26:47 -0700
Message-Id: <20200518172704.29608-1-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This adds a TPM 2.0 key parser and asymmetric key type for access to
the TPM for encryption, decryption, sign, and verify using RSA private
keys. The majority of the work went into the tpm driver subsystem
piggy backing off some old, not-yet-upstreamed, patches from James
Bottomley. These can be found here, and they are attached in this
patch set:

https://lore.kernel.org/linux-crypto/1568031408.6613.29.camel@HansenPartnership.com/

There is also a patch from James which may already be upstreamed which
adds some OID registry values for TPM keys. I have also copied over
the ASN.1 definition from the trusted key type in order to parse a
TPM key from asymmetric keys.

These patches have been rebased on top of 5.6, and I would urge
James to take a look at these and make sure I rebased them correctly.
(The folder structure of the TPM/trusted subsystem had since changed
in the kernel since these patches, so I did my best).

As far as the patches are concerned the majority of the functionality
happens in drivers/char/tpm/tpm2-cmd.c: tpm2_rsa_decrypt(). This takes
a parent handle, key blob, and data to be decrypted. Assuming the parent
exists and the key blob is valid the data will be decrypted using the
TPM. This API can also be used for signing by pre-padding the input data
with pkcs1, effectively turning a decrypt call into an encryption using
the private key.

The parser and asymmetric key type are relatively simple modules. The
key parser uses the ASN.1 definition described earlier to parse out
the public and private portions of the key. From here the TPM2
asymmetric key type extracts the pieces of the private and public
keys which the TPM needs to perform these operations. These are whats
referred to as the 'key blobs'.

This new asymmetric key type can be accessed using keyctl, and behaves
exactly the same as any other pkey operations. Below is how I have
been testing this functionality. It will require that you have the
proper tools installed to access the TPM (tss2/openssl_tpm2_engine).

# Starting from scratch, enable and clear TPM in BIOS

export TPM_INTERFACE_TYPE=dev
export TPM_DEVICE=/dev/tpm0

# Create a primary key for wrapping the user private key
# and make it persistent.
tsscreateprimary -hi o -st -ecc
# This should return a handle, in my case 80000000
tssevictcontrol -hi o -ho 80000000 -hp 81000001
tssflushcontext -ha 80000000

# Create a private key if not already
openssl genrsa > privkey.pem

# Wrap private key using the TPM
create_tpm2_key -w privkey.pem -p 81000001 privkey.tpm
# The above commands only need to be done once. A Null primary
# key could be used instead which would not require the above steps
# but that kind of key does not persist across boots meaning you
# would need to create a new wrapped TPM key every boot.
# privkey.pem could now be deleted as the key has been wrapped
# by the TPM.

# If built as modules, load parser and asymmetric key type
modprobe tpm2_key_parser
modprobe asym_tpm2

# Now asymmetric keyctl operations can be performed using
# privkey.tpm. First it needs to be converted into DER for
# keyctl
openssl asn1parse -inform pem -in privkey.tpm -noout -out privkey.tpm.der

# Add key to the kernel
serial=`cat privkey.tpm.der | keyctl padd asymmetric tpm @u`

# Create some data do be encrypted/signed
echo "abcdefg" > plaintext.txt

# Encrypt plaintext.txt
keyctl pkey_encrypt $serial 0 plaintext.txt enc=pkcs1 > encrypted.dat

# Decrypt encrypted data
keyctl pkey_decrypt $serial 0 encrypted.dat enc=pkcs1 > decrypted.dat

# Sign
keyctl pkey_sign $serial 0 plaintext.txt enc=pkcs1 hash=sha256 > signed.dat

# Verify
keyctl pkey_verify $serial 0 plaintext.txt signed.dat enc=pkcs1 hash=sha256

James Bottomley (12):
  tpm-buf: move from static inlines to real functions
  tpm-buf: add handling for TPM2B types
  tpm-buf: add cursor based functions for response parsing
  tpm2-space: export the context save and load commands
  tpm2-sessions: Add full HMAC and encrypt/decrypt session handling
  tpm-buf: add tpm_buf_parameters()
  tpm2: add hmac checks to tpm2_pcr_extend()
  tpm2: add session encryption protection to tpm2_get_random()
  trusted keys: Add session encryption protection to the seal/unseal
    path
  tpm: add the null key name as a tpm2 sysfs variable
  Documentation: add tpm-security.rst
  oid_registry: Add TCG defined OIDS for TPM keys

James Prestwood (5):
  tpm: tpm2-cmd: add driver API for RSA decryption
  include: linux: tpm: expose tpm2_rsa_decrypt
  include: crypto: add asym_tpm2_subtype definition
  asymmetric_keys: add TPM2 ASN1 definition
  asymmetric_keys: add tpm2 key parser/type

 Documentation/security/tpm/tpm-security.rst |  204 ++++
 crypto/asymmetric_keys/Kconfig              |   20 +
 crypto/asymmetric_keys/Makefile             |   12 +
 crypto/asymmetric_keys/asym_tpm2.c          |  653 ++++++++++
 crypto/asymmetric_keys/tpm2_parser.c        |  155 +++
 crypto/asymmetric_keys/tpm2key.asn1         |   23 +
 drivers/char/tpm/Kconfig                    |   11 +
 drivers/char/tpm/Makefile                   |    2 +
 drivers/char/tpm/tpm-buf.c                  |  202 ++++
 drivers/char/tpm/tpm-sysfs.c                |   29 +-
 drivers/char/tpm/tpm.h                      |   38 +
 drivers/char/tpm/tpm2-cmd.c                 |  523 +++++++-
 drivers/char/tpm/tpm2-sessions.c            | 1203 +++++++++++++++++++
 drivers/char/tpm/tpm2-sessions.h            |  114 ++
 drivers/char/tpm/tpm2-space.c               |    8 +-
 include/crypto/asym_tpm2_subtype.h          |   32 +
 include/linux/oid_registry.h                |    5 +
 include/linux/tpm.h                         |  160 ++-
 18 files changed, 3284 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/security/tpm/tpm-security.rst
 create mode 100644 crypto/asymmetric_keys/asym_tpm2.c
 create mode 100644 crypto/asymmetric_keys/tpm2_parser.c
 create mode 100644 crypto/asymmetric_keys/tpm2key.asn1
 create mode 100644 drivers/char/tpm/tpm-buf.c
 create mode 100644 drivers/char/tpm/tpm2-sessions.c
 create mode 100644 drivers/char/tpm/tpm2-sessions.h
 create mode 100644 include/crypto/asym_tpm2_subtype.h

-- 
2.21.1

