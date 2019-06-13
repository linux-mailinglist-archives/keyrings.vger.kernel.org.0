Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B9243C22
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbfFMPeN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:34:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33758 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbfFMKck (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 06:32:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id x15so11604909pfq.0
        for <keyrings@vger.kernel.org>; Thu, 13 Jun 2019 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BG6KAi08hN8hMpB1R8APRtbarxqkieDJBwiiKnKxNvA=;
        b=qXrt3EVTApU5PvFn4bX//ulUNLUoEPsUKJqd/tEwgQrVBEW7kK6cIqJbHvlbz0ZwZw
         yXkdyYL78AAok2TZ4dUIK02ownxUUArBRRhlZFyofgOaJ5Ab0Xqmfb61n4o8y6gNLDFA
         9uq1ElY6ote0C9kIBMHRPLdLqbL7XZUgXPfzQaKaRLdAe00jHCagKg7cvHL/ECbtjyr6
         O5B0MYJenVXtiZPFm2DIsWKMKQpoYDyi9ooepPfnJACg1HGlqLmyY9jYOmIbj1SFpKWo
         dR9tq4Slzc5DwWnZCRZ6ifEeYJDQNLKZ6Ip3CeXwhTQgjdCNZQuDE2Nn0S6CbrO9y+l0
         tWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BG6KAi08hN8hMpB1R8APRtbarxqkieDJBwiiKnKxNvA=;
        b=oR8H4EDwseAXnD8zBSEzVPNLP1yf++vxsi48b5X+XITxFA8GP9WoS8ONLsN4MArU3n
         xhjkC4OzNB3/llkxyhpjPDHNjN4C9Xml2lHs5K0ekkgZv4Xo4P18ymta3Y2EPxtkHGZY
         w49osJdFrhRhEpCwySGm/4x6lU7xzswVllobcakXd7DxSJLIJqdbmN3bhKBwukecVC2b
         bmZDopej7jXd9efr5ARB8hGmKqdFxvISNI0W6Fjm6LvTAAG7T/2CFjkpqsyxsJW84iH/
         0Hn0gDfpCIox2cpJEmjz9koYtRqUe4/tylF3PW6odNy58twKhLrtNqQ9MhADZ3y3hlxL
         zkkQ==
X-Gm-Message-State: APjAAAVqWrFNYRV7Dt/lWhdL9VbmFkEJUq/3ZEMoMESAWzzKY3H5eJiw
        7DdgGvywOtNSg/FweBEO622KhL5nFbA=
X-Google-Smtp-Source: APXvYqwugJNID3a+Q06ltN9H4nYz1MsjaA/m5NgmF0QwxbLeIBkdJqh8Wkw1R9zzI/mvvBxALIBd2g==
X-Received: by 2002:a62:ee17:: with SMTP id e23mr94599955pfi.130.1560421958641;
        Thu, 13 Jun 2019 03:32:38 -0700 (PDT)
Received: from localhost.localdomain ([117.196.234.139])
        by smtp.gmail.com with ESMTPSA id a12sm2265078pgq.0.2019.06.13.03.32.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 13 Jun 2019 03:32:37 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC 6/7] doc: keys: Document usage of TEE based Trusted Keys
Date:   Thu, 13 Jun 2019 16:00:32 +0530
Message-Id: <1560421833-27414-7-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Provide documentation for usage of TEE based Trusted Keys via existing
user-space "keyctl" utility. Also, document various use-cases.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/security/keys/tee-trusted.rst | 93 +++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/security/keys/tee-trusted.rst

diff --git a/Documentation/security/keys/tee-trusted.rst b/Documentation/security/keys/tee-trusted.rst
new file mode 100644
index 0000000..ef03745
--- /dev/null
+++ b/Documentation/security/keys/tee-trusted.rst
@@ -0,0 +1,93 @@
+======================
+TEE based Trusted Keys
+======================
+
+TEE based Trusted Keys provides an alternative approach for providing Trusted
+Keys in case TPM chip isn't present.
+
+Trusted Keys use a TEE service/device both to generate and to seal the keys.
+Keys are sealed under a hardware unique key in the TEE, and only unsealed by
+the TEE.
+
+For more information about TEE, refer to ``Documentation/tee.txt``.
+
+Usage::
+
+    keyctl add trusted name "new keylen" ring
+    keyctl add trusted name "load hex_blob" ring
+    keyctl print keyid
+
+"keyctl print" returns an ascii hex copy of the sealed key, which is in format
+specific to TEE device implementation.  The key length for new keys are always
+in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
+
+Examples of trusted key and its usage as 'master' key for encrypted key usage:
+
+More details about encrypted keys can be found here:
+``Documentation/security/keys/trusted-encrypted.rst``
+
+Create and save a trusted key named "kmk" of length 32 bytes::
+
+    $ keyctl add trusted kmk "new 32" @u
+    754414669
+
+    $ keyctl show
+    Session Keyring
+     827385718 --alswrv      0 65534  keyring: _uid_ses.0
+     274124851 --alswrv      0 65534   \_ keyring: _uid.0
+     754414669 --als-rv      0     0       \_ trusted: kmk
+
+    $ keyctl print 754414669
+    15676790697861b422175596ae001c2f505cea2c6f3ebbc5fb08eeb1f343a07e
+
+    $ keyctl pipe 754414669 > kmk.blob
+
+Load a trusted key from the saved blob::
+
+    $ keyctl add trusted kmk "load `cat kmk.blob`" @u
+    491638700
+
+    $ keyctl print 491638700
+    15676790697861b422175596ae001c2f505cea2c6f3ebbc5fb08eeb1f343a07e
+
+The initial consumer of trusted keys is EVM, which at boot time needs a high
+quality symmetric key for HMAC protection of file metadata.  The use of a
+TEE based trusted key provides security that the EVM key has not been
+compromised by a user level problem and tied to particular hardware.
+
+Create and save an encrypted key "evm" using the above trusted key "kmk":
+
+option 1: omitting 'format'::
+
+    $ keyctl add encrypted evm "new trusted:kmk 32" @u
+    608915065
+
+option 2: explicitly defining 'format' as 'default'::
+
+    $ keyctl add encrypted evm "new default trusted:kmk 32" @u
+    608915065
+
+    $ keyctl print 608915065
+    default trusted:kmk 32 f380ac588a925f488d5be007cf23e4c900b8b652ab62241c8
+    ed54906189b6659d139d619d4b51752a2645537b11fd44673f13154a65b3f595d5fb2131
+    2fe45529ea0407c644ea4026f2a1a75661f2c9b66
+
+    $ keyctl pipe 608915065 > evm.blob
+
+Load an encrypted key "evm" from saved blob::
+
+    $ keyctl add encrypted evm "load `cat evm.blob`" @u
+    831684262
+
+    $ keyctl print 831684262
+    default trusted:kmk 32 f380ac588a925f488d5be007cf23e4c900b8b652ab62241c8
+    ed54906189b6659d139d619d4b51752a2645537b11fd44673f13154a65b3f595d5fb2131
+    2fe45529ea0407c644ea4026f2a1a75661f2c9b66
+
+Other uses for trusted and encrypted keys, such as for disk and file encryption
+are anticipated.  In particular the 'ecryptfs' encrypted keys format can be used
+to mount an eCryptfs filesystem.  More details about the usage can be found in
+the file ``Documentation/security/keys/ecryptfs.rst``.
+
+Another format 'enc32' can be used to support encrypted keys with payload size
+of 32 bytes.
-- 
2.7.4

