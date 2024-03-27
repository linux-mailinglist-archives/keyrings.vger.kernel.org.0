Return-Path: <keyrings+bounces-995-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78B88D8D2
	for <lists+keyrings@lfdr.de>; Wed, 27 Mar 2024 09:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB7B91F2B4D3
	for <lists+keyrings@lfdr.de>; Wed, 27 Mar 2024 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBFA2E62C;
	Wed, 27 Mar 2024 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="gZiImaV+"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91D2D627
	for <keyrings@vger.kernel.org>; Wed, 27 Mar 2024 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527909; cv=none; b=KdJe/ZDJR7uJIeMkSaDgLz63MjKe1QoW7JZCaTooK+MtuFQq+7HtLqOKVgZaOMwO5WF9Ctk9tAk3XHOcBj30D5UYQ1nTugPqHNU3rLbiTGq/fJ5dChMz67kzIoFlPSb+Tl1HK0I5zawZ55h6HQimlPPmKabAWN4gubbYT688N0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527909; c=relaxed/simple;
	bh=Ze8zK2HY9+0PRvVXT50gi5jYVTJlg7k/wpO4RIzfls4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQFxN5LsJVSPe2hWBR5T06K7rzKK77EYaD2B2l0GcU1J8HQW2VYuNiT0tuacCR44PEwhAnsgVJXSxFAme263ulJqUzN4r5mRWYuLJzImNk7txFxyTxtV1bi1G1WkQoQSMRbUPHa34vjI0Fzy7czckM1D88OtXSfVaLrOd+o2FUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=gZiImaV+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d6ee6c9945so9494361fa.3
        for <keyrings@vger.kernel.org>; Wed, 27 Mar 2024 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527904; x=1712132704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXnPhQZ/7MwqBVH7e72M3iqDK5PHqiK3NcW8fk9T+qY=;
        b=gZiImaV+WStIGoHn7lC47kIhZg4G3h+FDJrdHrnaQjDzOWa4Fd+HQAQSiWjfA7aNi/
         teQOtXTFUeTcCQEGDDr0Q6PCZGG+18Szom39b0TfzdEIt5lwFmoweaRENqDpG2nTM81v
         XaKZMTl+w4VNa99Cpgbokm9OFRpgUA1FhpL5rugcOMwDTLSmwl0X8kFy+aQ1uOtfat/3
         3cEuDqdIVpVUvCS2alftIm4wERpMh3JuKVZwt37buiqa7SvFuQ5yHHUHkMk2OfJwjE/S
         x9nuy1l370P8A2uUj6NpBBXXcQj5ydR9yiL2HwXwuHV9P2L6w042mot2x9DHk3oiquQI
         dmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527904; x=1712132704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXnPhQZ/7MwqBVH7e72M3iqDK5PHqiK3NcW8fk9T+qY=;
        b=e2vlUKS2+RjuEFURKEWs6QXGWfDQ3MTGI4dVkoJrcO3lNAfHCMz0uX73zz4VVSzuAp
         fgbwi4fiKuH2Lc98T4SDr4sN0AXyxk4uZN4yp97kWauL3yWAepJIns/y2h8h1LSJInN+
         kaflkJIp4g6NLoJwo2QmCNnbbcB7OXz/ca7873NjKmIgVPT/AJcR6FXFRcF701GxEoIj
         PWWfmmbF74glWMRSZeBBFh+3omMUiMVt+DQVthOhXV6YiQ6UjPmuaDn400f86l1Ff/c3
         hsYDV7xqraFVBNn3rJqnlMekrHrtMKVKEwS8zw/KZg1xqNDVc7SDG3fT9hIDEt/tOEVq
         b+wg==
X-Forwarded-Encrypted: i=1; AJvYcCVH3b4Sz9syjjwTSWXSXi/IY0FWczSv6ePp/Xl0EqcveLXpgUllSlyfw63bEHQsreFztRUJeD3waEa/KaQIvoQEE5diXyAHjMc=
X-Gm-Message-State: AOJu0YxQ573OSXIWI/ji+HjbqRGeB3gSZk6lSwHWOfdygxBkRPYfi3rj
	h2K5rw8s0P+0skx4SjLgAvDJPXmb5EJR8ssgYuFF/LvkR2GQPYtmabEibOdjfdI=
X-Google-Smtp-Source: AGHT+IEWDMVFB/sih4uk6d/ut3w2v5mnLyG+wQLmIUZcFC2ZLVZVl9kZujBi8i5UNu5rg7+ev/+CLw==
X-Received: by 2002:a2e:a984:0:b0:2d4:170d:245f with SMTP id x4-20020a2ea984000000b002d4170d245fmr2716878ljq.12.1711527904204;
        Wed, 27 Mar 2024 01:25:04 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id ch9-20020a5d5d09000000b00341c6778171sm9880373wrb.83.2024.03.27.01.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:04 -0700 (PDT)
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
	linux-security-module@vger.kernel.org
Subject: [PATCH v7 0/6] DCP as trusted keys backend
Date: Wed, 27 Mar 2024 09:24:46 +0100
Message-ID: <20240327082454.13729-1-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a revival of the previous patch set submitted by Richard Weinberger:
https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@nod.at/

After having been thoroughly reviewed by Jarkko, it would be great if this
could go into 6.10. :-)

v6 is here (please ignore the incorrect version number in the cover letter):
https://lore.kernel.org/keyrings/20240307153842.80033-1-david@sigma-star.at/

v6 -> v7:
- Add Reviewed-by from Jarkko Sakkinen for patches #1 and #3
- Improved commit messages
- Changed log level for non-trusted/secure mode check from error to warning
v5 -> v6:
- Cleaned up coding style and commit messages to make the whole series more
  coherent as suggested by Jarkko Sakkinen
- Added Acked-By from Jarkko Sakkinen to patch #4 - thanks!
- Rebased against next-20240307
v4 -> v5:
- Make Kconfig for trust source check scalable as suggested by Jarkko Sakkinen
- Add Acked-By from Herbert Xu to patch #1 - thanks!
v3 -> v4:
- Split changes on MAINTAINERS and documentation into dedicated patches
- Use more concise wording in commit messages as suggested by Jarkko Sakkinen
v2 -> v3:
- Addressed review comments from Jarkko Sakkinen
v1 -> v2:
- Revive and rebase to latest version
- Include review comments from Ahmad Fatoum

The Data Co-Processor (DCP) is an IP core built into many NXP SoCs such
as i.mx6ull.

Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
encrypt/decrypt user data using a unique, never-disclosed,
device-specific key. Unlike CAAM though, it cannot directly wrap and
unwrap blobs in hardware. As DCP offers only the bare minimum feature
set and a blob mechanism needs aid from software. A blob in this case
is a piece of sensitive data (e.g. a key) that is encrypted and
authenticated using the device-specific key so that unwrapping can only
be done on the hardware where the blob was wrapped.

This patch series adds a DCP based, trusted-key backend and is similar
in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
It is of interest for similar use cases as the CAAM patch set, but for
lower end devices, where CAAM is not available.

Because constructing and parsing the blob has to happen in software,
we needed to decide on a blob format and chose the following:

struct dcp_blob_fmt {
	__u8 fmt_version;
	__u8 blob_key[AES_KEYSIZE_128];
	__u8 nonce[AES_KEYSIZE_128];
	__le32 payload_len;
	__u8 payload[];
} __packed;

The `fmt_version` is currently 1.

The encrypted key is stored in the payload area. It is AES-128-GCM
encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
the end of the payload (`payload_len` does not include the size of
the auth tag).

The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generated
randomly, when sealing/exporting the DCP blob.

This patchset was tested with dm-crypt on an i.MX6ULL board.

[0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@pengutronix.de/

David Gstir (6):
  crypto: mxs-dcp: Add support for hardware-bound keys
  KEYS: trusted: improve scalability of trust source config
  KEYS: trusted: Introduce NXP DCP-backed trusted keys
  MAINTAINERS: add entry for DCP-based trusted keys
  docs: document DCP-backed trusted keys kernel params
  docs: trusted-encrypted: add DCP as new trust source

 .../admin-guide/kernel-parameters.txt         |  13 +
 .../security/keys/trusted-encrypted.rst       |  85 +++++
 MAINTAINERS                                   |   9 +
 drivers/crypto/mxs-dcp.c                      | 104 +++++-
 include/keys/trusted_dcp.h                    |  11 +
 include/soc/fsl/dcp.h                         |  20 ++
 security/keys/trusted-keys/Kconfig            |  18 +-
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_dcp.c      | 313 ++++++++++++++++++
 10 files changed, 567 insertions(+), 14 deletions(-)
 create mode 100644 include/keys/trusted_dcp.h
 create mode 100644 include/soc/fsl/dcp.h
 create mode 100644 security/keys/trusted-keys/trusted_dcp.c

-- 
2.35.3


