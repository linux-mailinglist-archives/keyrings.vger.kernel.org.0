Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EB11D8019
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgERR1Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgERR1Y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:24 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E91EC05BD09
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:24 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id a5so145707pjh.2
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+JhAmACYrGKst40jmDeYo55LB9G4V6DnAgWvanWMBM=;
        b=aq5+pGMWC+O7ro5FPc8NTOsTHv0qDkKqZ8Sfiz8UEwro9OPNkUHT0Ke/qgzp7m9FRe
         UBmeD0DyiypQa7rfF5XSzqFOY+uAOh+BAdNaAVtYB4W0eMBoJqlPViJxSBuJ+8XcoDsZ
         MULgsllRWFOinNtHNj3GcXnbTjQKs+9LOoOek8Ls05TOAvuvWhv2s/sOU3thyZKWxlt9
         JmmJU8tR9C7oeiKOJWur1lAHgqB297e9cVbdO3iXfjHANuvw/Vryzz/+x8U664w0jG8E
         TQ4fb31P+2nDT5ONuw8hUnO0w8dkdWcvoL1MhjazTy3T5OEv3NEfIYxhwUfV4Wdqk3R1
         1w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+JhAmACYrGKst40jmDeYo55LB9G4V6DnAgWvanWMBM=;
        b=EmpLBdidoc7zz7Xszfsd3CVb4MyICldEKaAsNT6URvQs2usYLVNck5FvICYWKWwzfs
         MbsutpI5WOwpL8BBe5YjwwhO8hc58BkgIv3kG3EQYvOPpOX7JlGHH0+MD8bJF5mT7i+w
         dwcfFNPVEWtaIiDrWt3IKbSZk86HfstBzzTrueS4LsouahGMUQ56Ab8Ye5B+9Y9R+9uw
         Q6qvuy9eCffEMaHzRsmmJdsOr6aoFwnKnHReBCoXjOtOT5tohz+KLUYsPeLTh6rR752g
         iy9DDEMvNOE8HUeknfFDI7vXDDFm74UHluyynmfQBCW98QIqcp/K1flCFSC9DNeQkLsV
         vNXQ==
X-Gm-Message-State: AOAM533Udp8maC0p0dbjoBjmQz8KLqRdZLMCUt69XbcPQjtnvaWNxshL
        Fpk6zPTxurqAdg2vsRxbllf7FfYk4uE=
X-Google-Smtp-Source: ABdhPJxa6aB9yNPJlqMiZoTEZyFx6aaBlBQt1hEzMsOkhvzbT9G6sITUcXx1oUuyUKyCQk1wMyD6+A==
X-Received: by 2002:a17:902:7b94:: with SMTP id w20mr17030001pll.8.1589822843221;
        Mon, 18 May 2020 10:27:23 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:22 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 11/17] Documentation: add tpm-security.rst
Date:   Mon, 18 May 2020 10:26:58 -0700
Message-Id: <20200518172704.29608-12-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

Document how the new encrypted secure interface for TPM2 works and how
security can be assured after boot by certifying the NULL seed.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 Documentation/security/tpm/tpm-security.rst | 204 ++++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/security/tpm/tpm-security.rst

diff --git a/Documentation/security/tpm/tpm-security.rst b/Documentation/security/tpm/tpm-security.rst
new file mode 100644
index 000000000000..3411030505a1
--- /dev/null
+++ b/Documentation/security/tpm/tpm-security.rst
@@ -0,0 +1,204 @@
+TPM Security
+============
+
+The object of this document is to describe how we make the kernel's
+use of the TPM reasonably robust in the face of external snooping and
+packet alteration attacks.  The current security document is for TPM
+2.0.
+
+Introduction
+------------
+
+The TPM is usually a discrete chip attached to a PC via some type of
+low bandwidth bus.  There are exceptions to this such as the Intel
+PTT, which is a software TPM running inside a software environment
+close to the CPU, which are subject to different attacks, but right at
+the moment, most hardened security environments require a discrete
+hardware TPM, which is the use case discussed here.
+
+Snooping and Alteration Attacks against the bus
+-----------------------------------------------
+
+The current state of the art for snooping the TPM Genie hardware
+interposer https://www.nccgroup.trust/us/our-research/tpm-genie/ which
+is a simple external device that can be installed in a couple of
+seconds on any system or laptop.  However, the next phase of research
+seems to be hacking existing devices on the bus to act as interposers,
+so the fact that the attacker requires physical access for a few
+seconds might evaporate.  However, the goal of this document is to
+protect TPM secrets and integrity as far as we are able in this
+environment and to try to insure that if we can't prevent the attack
+then at least we can detect it.
+
+Unfortunately, most of the TPM functionality, including the hardware
+reset capability can be controlled by an attacker who has access to
+the bus, so we'll discuss some of the disruption possibilities below.
+
+Measurement (PCR) Integrity
+---------------------------
+
+Since the attacker can send their own commands to the TPM, they can
+send arbitrary PCR extends and thus disrupt the measurement system,
+which would be an annoying denial of service attack.  However, there
+are two, more serious, classes of attack aimed at entities sealed to
+trust measurements.
+
+1. The attacker could intercept all PCR extends coming from the system
+   and completely substitute their own values, producing a replay of
+   an untampered state that would cause PCR measurements to attest to
+   a trusted state and release secrets
+
+2. At some point in time the attacker could reset the TPM, clearing
+   the PCRs and then send down their own measurements which would
+   effectively overwrite the boot time measurements the TPM has
+   already done.
+
+The first can be thwarted by always doing HMAC protection of the PCR
+extend and read command meaning measurement values cannot be
+substituted without producing a detectable HMAC failure in the
+response.  However, the second can only really be detected by relying
+on some sort of mechanism for protection which would change over TPM
+reset.
+
+Secrets Guarding
+----------------
+
+Certain information passing in and out of the TPM, such as key sealing
+and private key import and random number generation, is vulnerable to
+interception which HMAC protection alone cannot protect, so for these
+types of command we must also employ request and response encryption
+to prevent the loss of secret information.
+
+Establishing Initial Trust with the TPM
+---------------------------------------
+
+In order to provide security from the beginning, an initial shared or
+asymmetric secret must be established which must also be unknown to
+the attacker.  The most obvious avenues for this are the endorsement
+and storage seeds, which can be used to derive asymmetric keys.
+However, using these keys is difficult because the only way to pass
+them into the kernel would be on the command line, which requires
+extensive support in the boot system, and there's no guarantee that
+either hierarchy would not have some type of authorization.
+
+The mechanism chosen for the Linux Kernel is to derive the primary
+elliptic curve key from the null seed using the standard storage seed
+parameters.  The null seed has two advantages: firstly the hierarchy
+physically cannot have an authorization, so we are always able to use
+it and secondly, the null seed changes across TPM resets, meaning if
+we establish trust on the null seed at start of day, all sessions
+salted with the derived key will fail if the TPM is reset and the seed
+changes.
+
+Obviously using the null seed without any other prior shared secrets,
+we have to create and read the initial public key which could, of
+course, be intercepted and substituted by the bus interposer.
+However, the TPM has a key certification mechanism (using the EK
+endorsement certificate, creating an attestation identity key and
+certifying the null seed primary with that key) which is too complex
+to run within the kernel, so we keep a copy of the null primary key
+name, which is what is certified so user-space can run the full
+certification when it boots.  The definitive guarantee here is that if
+the null primary key certifies correctly, you know all your TPM
+transactions since start of day were secure and if it doesn't, you
+know there's an interposer on your system (and that any secret used
+during boot may have been leaked).
+
+Stacking Trust
+--------------
+
+In the current null primary scenario, the TPM must be completely
+cleared before handing it on to the next consumer.  However the kernel
+hands to user-space the name of the derived null seed key which can
+then be verified by certification in user-space.  Therefore, this chain
+of name handoff can be used between the various boot components as
+well (via an unspecified mechanism).  For instance, grub could use the
+null seed scheme for security and hand the name off to the kernel in
+the boot area.  The kernel could make its own derivation of the key
+and the name and know definitively that if they differ from the handed
+off version that tampering has occurred.  Thus it becomes possible to
+chain arbitrary boot components together (UEFI to grub to kernel) via
+the name handoff provided each successive component knows how to
+collect the name and verifies it against its derived key.
+
+Session Properties
+------------------
+
+All TPM commands the kernel uses allow sessions.  HMAC sessions may be
+used to check the integrity of requests and responses and decrypt and
+encrypt flags may be used to shield parameters and responses.  The
+HMAC and encryption keys are usually derived from the shared
+authorization secret, but for a lot of kernel operations that is well
+known (and usually empty).  Thus, every HMAC session used by the
+kernel must be created using the null primary key as the salt key
+which thus provides a cryptographic input into the session key
+derivation.  Thus, the kernel creates the null primary key once (as a
+volatile TPM handle) and keeps it around in a saved context stored in
+tpm_chip for every in-kernel use of the TPM.  Currently, because of a
+lack of de-gapping in the in-kernel resource manager, the session must
+be created and destroyed for each operation, but, in future, a single
+session may also be reused for the in-kernel HMAC, encryption and
+decryption sessions.
+
+Protection Types
+----------------
+
+For every in-kernel operation we use null primary salted HMAC to
+protect the integrity.  Additionally, we use parameter encryption to
+protect key sealing and parameter decryption to protect key unsealing
+and random number generation.
+
+Null Primary Key Certification in Userspace
+===========================================
+
+Every TPM comes shipped with a couple of X.509 certificates for the
+primary endorsement key.  This document assumes that the Elliptic
+Curve version of the certificate exists at 01C00002, but will work
+equally well with the RSA certificate (at 01C00001).
+
+The first step in the certification is primary creation using the
+template from the `TCG EK Credential Profile`_ which allows comparison
+of the generated primary key against the one in the certificate (the
+public key must match).  Note that generation of the EK primary
+requires the EK hierarchy password, but a pre-generated version of the
+EC primary should exist at 81010002 and a TPM2_ReadPublic() may be
+performed on this without needing the key authority.  Next, the
+certificate itself must be verified to chain back to the manufacturer
+root (which should be published on the manufacturer website).  Once
+this is done, the generated EK primary key may now be used to run an
+attestation on the null seed.  The specific problem here is that the
+EK primary is not a signing key so cannot on its own be used to sign
+the key certification, hence the complex process below.
+
+Note: this process is a simplified abbreviation of the usual privacy
+CA based attestation process.  The assumption here is that the
+attestation is done by the TPM owner who thus has access to only the
+owner hierarchy.  The owner creates an external public/private key
+pair (assume elliptic curve in this case) and wraps the private key
+for import using an inner wrapping process and parented to the EC
+derived storage primary.  The TPM2_Import() is done using a parameter
+decryption HMAC session salted to the EK primary (which also does not
+require the EK key authority) meaning that the inner wrapping key is
+the encrypted parameter and thus the TPM will not be able to perform
+the import unless is possesses the certified EK so if the command
+succeeds and the HMAC verifies on return we know we have a loadable
+copy of the private key only for the certified TPM.  This key is now
+loaded into the TPM and the Storage primary flushed (to free up space
+for the null key generation).
+
+The null EC primary is now generated using the Storage profile
+outlined in the `TCG TPM v2.0 Provisioning Guidance`_; the name of
+this key (the hash of the public area) is computed and compared to the
+null seed name presented by the kernel in
+/sys/class/tpm/tpm0/null_name.  If the names do not match, the TPM is
+compromised.  If the names match, the user performs a TPM2_Certify()
+using the null primary as the object handle and the loaded private key
+as the sign handle and providing randomized qualifying data.  The
+signature of the returned certifyInfo is verified against the public
+part of the loaded private key and the qualifying data checked to
+prevent replay.  If all of these tests pass, the user is now assured
+that TPM integrity and privacy was preserved across the entire boot
+sequence of this kernel.
+
+.. _TCG EK Credential Profile: https://trustedcomputinggroup.org/resource/tcg-ek-credential-profile-for-tpm-family-2-0/
+.. _TCG TPM v2.0 Provisioning Guidance: https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
-- 
2.21.1

