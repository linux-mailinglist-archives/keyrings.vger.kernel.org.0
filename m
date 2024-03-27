Return-Path: <keyrings+bounces-1001-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC3C88D8F9
	for <lists+keyrings@lfdr.de>; Wed, 27 Mar 2024 09:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3CB1C26FAB
	for <lists+keyrings@lfdr.de>; Wed, 27 Mar 2024 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ACF4E1D0;
	Wed, 27 Mar 2024 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="XfvN7Gbh"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41994C600
	for <keyrings@vger.kernel.org>; Wed, 27 Mar 2024 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527929; cv=none; b=pPqbjGPlmmAN8E6d86mqg99FUNh2Sp7j4nYDoyvgK5qDDU8SewLrUu+DgxReXW0d5Mmy/phqhbP8qLBBSCNADJ5bfVR/uVZ9KCBCAX5njOMCc/ChJpmYSDe3W3h0DokBzln8FVeIRgjCGGxbckf0gr78hxQiXf5X+ymZWT+Kfvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527929; c=relaxed/simple;
	bh=FDOPf3xlGpDAEZuAPeTmAaGWnb+6zG3xNnz2qq7Ohj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l741NvptE8expqsdOObo+EMAGm5blMesZ2kYUYpWHKwcoS8RB1EcBkFuU/yF8tCKjBaZ+NEL47GtOMd+ntTe4tXwwUrif/CZJoh/pwzSxQ1srhmk2FlqXWXxZbTeH6ZcV/Eex51jx8p07+9ShxMaYg9+lp46f3xSGSpCqiE6Uh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=XfvN7Gbh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4149319511fso2954465e9.1
        for <keyrings@vger.kernel.org>; Wed, 27 Mar 2024 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527925; x=1712132725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otEyEh5HNjpSjKJb9y7tWHyWPlbFploqEwD1jDd84X0=;
        b=XfvN7Gbh77ezLOEcJ8eRipMXL7+5qJjKmYm/ORphg7HV0Zr6k29AN3D7cq7v9B2GM2
         tPbjFpIm/2337sSUvtuMU1LbZAfp3arcsBfnJrSv4ZgNUz5tGDZUsY7fZmv/jsrFRXzl
         JXHXlFQPCGzDBjY/rhafpZkF8WTd2XaeNiObcl/PRJV0+00RHkgDKfGgIabM7JftFsOn
         F5Oy9jP1NVcMhbaAKZ8IyMmB4IRzMCqIrcYjQNmXRPiRFLyd3G81MtZ5iKFhAnMLELeq
         5K1/KXID2vQar9Z4KtaRj+GG4wBjna+9EF/JFO2tt23tBq3B0aJ7KlpgRM/qAmN/ARIo
         3JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527925; x=1712132725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otEyEh5HNjpSjKJb9y7tWHyWPlbFploqEwD1jDd84X0=;
        b=jhq/z3N9OGjVvi9YnljkADp6TPl0I0zHvNwDtnQULe6sozesAuWV3jyDwQGv3ueWZG
         6OlbHg0S6ji9IxbNDAaBtUX92ZgDzWaGBhhvC3hQQA8ywa5ps0WAqEaWjLuzC+HaS8i/
         S5eFGp8woJ/GaRzNkAOnHS7WO2VGB37viJ2EPlmhT9jJdROZ78DLXlpfgpto12uQZJ0D
         wvQ/jdf9lgnkiY6DTap6Q2fIF+P9TX0SAabxxLlyiMK7Z965Nqgg8hMmUUf6WugoFAYt
         F1WVpDtlhlSjKmTNnXBN1h1CMlnQT9kOCxevQPwTQg5MgaYw53OZbLI68bTzfmHfpCkj
         YZtg==
X-Forwarded-Encrypted: i=1; AJvYcCXoU1khd+wQaWCmYHmREBwu1ATlHsmgu4JxzwlcAraVY7jraNKOis2+ItW/URdhAfsdS8Rg+Y1DrphYpqxAy4iqfdJYqqaVTlw=
X-Gm-Message-State: AOJu0YxicRDAPyDdb+b98kev/pwkcVCSvspT0vLlPexR0H8FU+SVKyJw
	iTMs58Cd/WEQ1YBW/CvBqPxBg4w4YWYylxEr/th5M43wTO2lrwRh0geXpGHPidg=
X-Google-Smtp-Source: AGHT+IG7wR0nbB0jDKSCAusOIuwb3AuuIwFZ056wKDFtuOvUrA17eWCc0lIQ1zSgLo9xL9Vo01c6zQ==
X-Received: by 2002:a05:600c:6543:b0:414:8f85:6e50 with SMTP id dn3-20020a05600c654300b004148f856e50mr3234755wmb.19.1711527925056;
        Wed, 27 Mar 2024 01:25:25 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id u8-20020a05600c19c800b0041478393b8fsm1367979wmq.42.2024.03.27.01.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:24 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: David Gstir <david@sigma-star.at>,
	Shawn Guo <shawnguo@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	David Howells <dhowells@redhat.com>,
	Li Yang <leoyang.li@nxp.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Tejun Heo <tj@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-security-module@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v7 6/6] docs: trusted-encrypted: add DCP as new trust source
Date: Wed, 27 Mar 2024 09:24:52 +0100
Message-ID: <20240327082454.13729-7-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327082454.13729-1-david@sigma-star.at>
References: <20240327082454.13729-1-david@sigma-star.at>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the documentation for trusted and encrypted KEYS with DCP as new
trust source:

- Describe security properties of DCP trust source
- Describe key usage
- Document blob format

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 .../security/keys/trusted-encrypted.rst       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index e989b9802f92..81fb3540bb20 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -42,6 +42,14 @@ safe.
          randomly generated and fused into each SoC at manufacturing time.
          Otherwise, a common fixed test key is used instead.
 
+     (4) DCP (Data Co-Processor: crypto accelerator of various i.MX SoCs)
+
+         Rooted to a one-time programmable key (OTP) that is generally burnt
+         in the on-chip fuses and is accessible to the DCP encryption engine only.
+         DCP provides two keys that can be used as root of trust: the OTP key
+         and the UNIQUE key. Default is to use the UNIQUE key, but selecting
+         the OTP key can be done via a module parameter (dcp_use_otp_key).
+
   *  Execution isolation
 
      (1) TPM
@@ -57,6 +65,12 @@ safe.
 
          Fixed set of operations running in isolated execution environment.
 
+     (4) DCP
+
+         Fixed set of cryptographic operations running in isolated execution
+         environment. Only basic blob key encryption is executed there.
+         The actual key sealing/unsealing is done on main processor/kernel space.
+
   * Optional binding to platform integrity state
 
      (1) TPM
@@ -79,6 +93,11 @@ safe.
          Relies on the High Assurance Boot (HAB) mechanism of NXP SoCs
          for platform integrity.
 
+     (4) DCP
+
+         Relies on Secure/Trusted boot process (called HAB by vendor) for
+         platform integrity.
+
   *  Interfaces and APIs
 
      (1) TPM
@@ -94,6 +113,11 @@ safe.
 
          Interface is specific to silicon vendor.
 
+     (4) DCP
+
+         Vendor-specific API that is implemented as part of the DCP crypto driver in
+         ``drivers/crypto/mxs-dcp.c``.
+
   *  Threat model
 
      The strength and appropriateness of a particular trust source for a given
@@ -129,6 +153,13 @@ selected trust source:
      CAAM HWRNG, enable CRYPTO_DEV_FSL_CAAM_RNG_API and ensure the device
      is probed.
 
+  *  DCP (Data Co-Processor: crypto accelerator of various i.MX SoCs)
+
+     The DCP hardware device itself does not provide a dedicated RNG interface,
+     so the kernel default RNG is used. SoCs with DCP like the i.MX6ULL do have
+     a dedicated hardware RNG that is independent from DCP which can be enabled
+     to back the kernel RNG.
+
 Users may override this by specifying ``trusted.rng=kernel`` on the kernel
 command-line to override the used RNG with the kernel's random number pool.
 
@@ -231,6 +262,19 @@ Usage::
 CAAM-specific format.  The key length for new keys is always in bytes.
 Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
 
+Trusted Keys usage: DCP
+-----------------------
+
+Usage::
+
+    keyctl add trusted name "new keylen" ring
+    keyctl add trusted name "load hex_blob" ring
+    keyctl print keyid
+
+"keyctl print" returns an ASCII hex copy of the sealed key, which is in format
+specific to this DCP key-blob implementation.  The key length for new keys is
+always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
+
 Encrypted Keys usage
 --------------------
 
@@ -426,3 +470,44 @@ string length.
 privkey is the binary representation of TPM2B_PUBLIC excluding the
 initial TPM2B header which can be reconstructed from the ASN.1 octed
 string length.
+
+DCP Blob Format
+---------------
+
+The Data Co-Processor (DCP) provides hardware-bound AES keys using its
+AES encryption engine only. It does not provide direct key sealing/unsealing.
+To make DCP hardware encryption keys usable as trust source, we define
+our own custom format that uses a hardware-bound key to secure the sealing
+key stored in the key blob.
+
+Whenever a new trusted key using DCP is generated, we generate a random 128-bit
+blob encryption key (BEK) and 128-bit nonce. The BEK and nonce are used to
+encrypt the trusted key payload using AES-128-GCM.
+
+The BEK itself is encrypted using the hardware-bound key using the DCP's AES
+encryption engine with AES-128-ECB. The encrypted BEK, generated nonce,
+BEK-encrypted payload and authentication tag make up the blob format together
+with a version number, payload length and authentication tag::
+
+    /*
+     * struct dcp_blob_fmt - DCP BLOB format.
+     *
+     * @fmt_version: Format version, currently being %1
+     * @blob_key: Random AES 128 key which is used to encrypt @payload,
+     *            @blob_key itself is encrypted with OTP or UNIQUE device key in
+     *            AES-128-ECB mode by DCP.
+     * @nonce: Random nonce used for @payload encryption.
+     * @payload_len: Length of the plain text @payload.
+     * @payload: The payload itself, encrypted using AES-128-GCM and @blob_key,
+     *           GCM auth tag of size AES_BLOCK_SIZE is attached at the end of it.
+     *
+     * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload_len +
+     * AES_BLOCK_SIZE.
+     */
+    struct dcp_blob_fmt {
+            __u8 fmt_version;
+            __u8 blob_key[AES_KEYSIZE_128];
+            __u8 nonce[AES_KEYSIZE_128];
+            __le32 payload_len;
+            __u8 payload[];
+    } __packed;
-- 
2.35.3


