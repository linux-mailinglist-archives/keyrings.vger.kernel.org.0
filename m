Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DFB292CF2
	for <lists+keyrings@lfdr.de>; Mon, 19 Oct 2020 19:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgJSRhD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 19 Oct 2020 13:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35962 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726552AbgJSRhC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 19 Oct 2020 13:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603129021;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=lYvd6Kc5MQZgVAzrvYKcsZrecx2ck/hDIb16nUNa8SU=;
        b=bNLT4mlJo3IREWVZAEEpECTkYx6Pg6kHSE/3n1/6LB6cKaSPLgSujJT8zKrE+TdZzKeKuD
        eed6qqpv2aSOlci31ujwWES0Epl1QmuNLPx7BB8nd7hUKB9Zl5IaKkvVe0Mbfb8I/xW4bE
        skzW/ADmpD3fLZAm0ejOafGurJ1sZ9E=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-0vCMaTDfMeis5S5xA-k-NQ-1; Mon, 19 Oct 2020 13:36:59 -0400
X-MC-Unique: 0vCMaTDfMeis5S5xA-k-NQ-1
Received: by mail-qv1-f72.google.com with SMTP id c6so379377qvo.8
        for <keyrings@vger.kernel.org>; Mon, 19 Oct 2020 10:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lYvd6Kc5MQZgVAzrvYKcsZrecx2ck/hDIb16nUNa8SU=;
        b=e/u8zYdgEeHGzE9AY4jve1PBqf9+9V6eqiZsLNv0Hu6LhGV6eoJEB6XvIxpyl95N4O
         PoQ8C/dtWaGEc6Mt/dLqciO08v2ILc1nhi0NExYwXrqnlPLYzi1JiwWKMeSx0Ly//ZGP
         CU9IlWxhiRBIx3ePcr7m33PKcLXrvDEmRTDfDrJWFrF9x8Z14OXc5sn7cds5VSlccnZJ
         s0R62Yhzc6TYPkU1eIjZ8NZPoRDyheKWmS61JN7InR0hOAUI4CPb/BWirGSFKu0kbvN6
         i+/N6nPSvSJTVgAK+Z2G8FWUT0yx+OJoigayknVqHf6gDlnDl8q8Owp8nEic4jcmki8z
         iLSQ==
X-Gm-Message-State: AOAM530cRxM+UpFjwvCCCGDKWH9rXoeBxyI5a2eLal9vArPEr0RGM6HX
        RP+7F6fli6YmFXBfvXsRkCAhmhdZfXFWUbJfk8s6GfKJcciTDlo82AWAdS6ElkwWaOref+ybfmF
        gkd5U9LxlXq/1mMB85ok=
X-Received: by 2002:ac8:5389:: with SMTP id x9mr575078qtp.106.1603129019008;
        Mon, 19 Oct 2020 10:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3+ziEhGgg3i43z5XMnTEnwSx2vwI9vWybcMni3mq3qdw3hxI6nEAg4xK1Cv/MhfSLFqhHkg==
X-Received: by 2002:ac8:5389:: with SMTP id x9mr575060qtp.106.1603129018778;
        Mon, 19 Oct 2020 10:36:58 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b8sm271101qkn.133.2020.10.19.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 10:36:58 -0700 (PDT)
From:   trix@redhat.com
To:     zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, jejb@linux.ibm.com,
        jarkko.sakkinen@linux.intel.com, dhowells@redhat.com,
        mortonm@chromium.org
Cc:     linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] security: remove unneeded break
Date:   Mon, 19 Oct 2020 10:36:53 -0700
Message-Id: <20201019173653.527-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 security/integrity/ima/ima_appraise.c     | 1 -
 security/keys/trusted-keys/trusted_tpm1.c | 1 -
 security/safesetid/lsm.c                  | 3 ---
 3 files changed, 5 deletions(-)

diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 3dd8c2e4314e..f400a6122b3c 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -181,7 +181,6 @@ enum hash_algo ima_get_hash_algo(struct evm_ima_xattr_data *xattr_value,
 		if (sig->version != 2 || xattr_len <= sizeof(*sig))
 			return ima_hash_algo;
 		return sig->hash_algo;
-		break;
 	case IMA_XATTR_DIGEST_NG:
 		/* first byte contains algorithm id */
 		ret = xattr_value->data[0];
diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
index b9fe02e5f84f..eddc9477d42a 100644
--- a/security/keys/trusted-keys/trusted_tpm1.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -901,7 +901,6 @@ static int datablob_parse(char *datablob, struct trusted_key_payload *p,
 		break;
 	case Opt_err:
 		return -EINVAL;
-		break;
 	}
 	return ret;
 }
diff --git a/security/safesetid/lsm.c b/security/safesetid/lsm.c
index 8a176b6adbe5..1079c6d54784 100644
--- a/security/safesetid/lsm.c
+++ b/security/safesetid/lsm.c
@@ -125,7 +125,6 @@ static int safesetid_security_capable(const struct cred *cred,
 		pr_warn("Operation requires CAP_SETUID, which is not available to UID %u for operations besides approved set*uid transitions\n",
 			__kuid_val(cred->uid));
 		return -EPERM;
-		break;
 	case CAP_SETGID:
 		/*
 		* If no policy applies to this task, allow the use of CAP_SETGID for
@@ -140,11 +139,9 @@ static int safesetid_security_capable(const struct cred *cred,
 		pr_warn("Operation requires CAP_SETGID, which is not available to GID %u for operations besides approved set*gid transitions\n",
 			__kuid_val(cred->uid));
 		return -EPERM;
-		break;
 	default:
 		/* Error, the only capabilities were checking for is CAP_SETUID/GID */
 		return 0;
-		break;
 	}
 	return 0;
 }
-- 
2.18.1

