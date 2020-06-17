Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D701FD7BE
	for <lists+keyrings@lfdr.de>; Wed, 17 Jun 2020 23:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgFQVmr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 17 Jun 2020 17:42:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44238 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726995AbgFQVmp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 17 Jun 2020 17:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592430164;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=ziGeZkLSk9E0BTm8y7vUR/zQZg7qRoz5nH/H2o7ywpo=;
        b=IIqFa7bYo+1Yof7aUTsJxdLd/ifqUAQT6UYPq8jHWbRZGS8r1q0buEHxqS9FNmtv4F/jf2
        XD0D7Aat5WbDb96xE+6EX6en/DKHkJlROWIGVrqcImo5FyEe+Dw0mHp2SJ+Z3zCFqy7LST
        bGYGvxue3IpwMlfPvoNWI75Fe6k29BI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-3r2e_5r1P8qm3ql2tKgkmg-1; Wed, 17 Jun 2020 17:42:40 -0400
X-MC-Unique: 3r2e_5r1P8qm3ql2tKgkmg-1
Received: by mail-qk1-f199.google.com with SMTP id x68so2928520qkd.1
        for <keyrings@vger.kernel.org>; Wed, 17 Jun 2020 14:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=ziGeZkLSk9E0BTm8y7vUR/zQZg7qRoz5nH/H2o7ywpo=;
        b=hdU5fLJeHn3ZHTSK9o940U76Td0BSsx3jGBGN4+ha6AzErMszufPXuSAWvM4crjpJr
         hUcNJU3zISaH02+dfNqrJ2r86uW1As7hjYTrQUWjDKLzrQkmbbXxZeLO8q7GGVRti93O
         bF8Ge80cfkkN9Hc6eK60XzAwDbpQ0ArEOf6/wI7VoGaqM6wocc3BfOqtogJY0M+hjF9n
         RyTpyO+dNw6sbkU8xv1KYm1tF/AW3Wz9QXz4gLkwZprgDNVNBD1psDktkOLzv5ICFKQw
         bZizasOuysB7+UyCbhqCtlgDoqg+xJrH0Clri8CAMF3ycYtaD0ELSAiWuNE4aFvq1Vsx
         al7w==
X-Gm-Message-State: AOAM531VNLszQrUZBcL0ukRIc/AAkPHPpfE8ujsf5ULWmP0iCHw4riN5
        s2SNShmvzGDbrw0ydDu0DXd1YqLMwt+dDawZkxqOi+HX1jd62dqGjMg6scc8f2NqkjyBkW+cgC9
        QgYNZoPGcxrvwWmM/x2I=
X-Received: by 2002:aed:2a67:: with SMTP id k36mr1274726qtf.359.1592430160521;
        Wed, 17 Jun 2020 14:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2bbP1YY8oRqBLRJKk1O2Q+kPjLjdrsw0NkCYdnMEgqf+vfB9Irncji1qGx0MVsMoR6psqtw==
X-Received: by 2002:aed:2a67:: with SMTP id k36mr1274697qtf.359.1592430160226;
        Wed, 17 Jun 2020 14:42:40 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
        by smtp.gmail.com with ESMTPSA id k17sm1225973qtb.5.2020.06.17.14.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 14:42:39 -0700 (PDT)
Date:   Wed, 17 Jun 2020 14:42:37 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v10 2/8] oid_registry: Add TCG defined OIDS for TPM keys
Message-ID: <20200617214237.dlvfnx2s7aw4sfng@cantor>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
References: <20200616160229.8018-1-James.Bottomley@HansenPartnership.com>
 <20200616160229.8018-3-James.Bottomley@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20200616160229.8018-3-James.Bottomley@HansenPartnership.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue Jun 16 20, James Bottomley wrote:
>The TCG has defined an OID prefix "2.23.133.10.1" for the various TPM
>key uses.  We've defined three of the available numbers:
>
>2.23.133.10.1.3 TPM Loadable key.  This is an asymmetric key (Usually
>		RSA2048 or Elliptic Curve) which can be imported by a
>		TPM2_Load() operation.
>
>2.23.133.10.1.4 TPM Importable Key.  This is an asymmetric key (Usually
>		RSA2048 or Elliptic Curve) which can be imported by a
>		TPM2_Import() operation.
>
>Both loadable and importable keys are specific to a given TPM, the
>difference is that a loadable key is wrapped with the symmetric
>secret, so must have been created by the TPM itself.  An importable
>key is wrapped with a DH shared secret, and may be created without
>access to the TPM provided you know the public part of the parent key.
>
>2.23.133.10.1.5 TPM Sealed Data.  This is a set of data (up to 128
>		bytes) which is sealed by the TPM.  It usually
>		represents a symmetric key and must be unsealed before
>		use.
>

James, which document are these defined in? I was searching last night,
and couldn't find it.

>The ASN.1 binary key form starts of with this OID as the first element
>of a sequence, giving the binary form a unique recognizable identity
>marker regardless of encoding.
>
>Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>Reviewed-by: David Howells <dhowells@redhat.com>
>
>---
>
>v3: correct OID_TPMImportableKey name
>v7: add ack
>v9: add review
>---
> include/linux/oid_registry.h | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
>index 657d6bf2c064..f6e2276e5f30 100644
>--- a/include/linux/oid_registry.h
>+++ b/include/linux/oid_registry.h
>@@ -107,6 +107,11 @@ enum OID {
> 	OID_gostTC26Sign512B,		/* 1.2.643.7.1.2.1.2.2 */
> 	OID_gostTC26Sign512C,		/* 1.2.643.7.1.2.1.2.3 */
>
>+	/* TCG defined OIDS for TPM based keys */
>+	OID_TPMLoadableKey,		/* 2.23.133.10.1.3 */
>+	OID_TPMImportableKey,		/* 2.23.133.10.1.4 */
>+	OID_TPMSealedData,		/* 2.23.133.10.1.5 */
>+
> 	OID__NR
> };
>
>-- 
>2.26.2
>

