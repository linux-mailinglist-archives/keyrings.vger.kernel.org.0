Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0635242CB
	for <lists+keyrings@lfdr.de>; Thu, 12 May 2022 04:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242563AbiELCe0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 11 May 2022 22:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242267AbiELCeX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 11 May 2022 22:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF298134E50
        for <keyrings@vger.kernel.org>; Wed, 11 May 2022 19:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652322861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sd8cjBSOdeaVjyH4f3lxl+0xYw15nzSjwpJw6bzSgLk=;
        b=R5SlE2/gydXtRgUTFONXovuwnLplJogOlNJhPUX7xNva8vbqnAglcGKZO3lZ4+J87uVDL2
        dcIBIUPeE8B6mH8KRKIUucwKp/CL/9rwGXwzUs5AZanKdu1oZhCzW8AsEWLvD9M6+Q3FkO
        C/nA2ou+ghNP+uv8deTHtLcICjm6r3I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-MTvWB2ZlNxGf0lsrBMgBAg-1; Wed, 11 May 2022 22:34:20 -0400
X-MC-Unique: MTvWB2ZlNxGf0lsrBMgBAg-1
Received: by mail-pf1-f198.google.com with SMTP id 67-20020a621846000000b0050d22f49732so1934453pfy.14
        for <keyrings@vger.kernel.org>; Wed, 11 May 2022 19:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sd8cjBSOdeaVjyH4f3lxl+0xYw15nzSjwpJw6bzSgLk=;
        b=5ppnU+ACh6QlwSrTKbI1uCkUpNFO43UN6bU2EqMiD8W9qIPsVriL+tswJz1SFuFxqa
         ut1hBXXDRqyLmgFSHWEvg5vAFdsyx9H1xPZwlW+PZztlYUjOjsVuHuHrOe2kfzKzLg9e
         DoYYSE3SgdddO0lT/TU2RIrxbFDAU3IntBEQGKaVHvkaidHDPRLuyYXpS58oppwfXKTk
         KB56419PmtWhwxaYN0upSt2ITW056ddXrvvc0jutqea3H3WYeU6ZUKUzjBb7LKUVdBCa
         Jab+j3GC4oSw+pVGxM5Sm60l0Yl3n9RDcdyH6miVa4G/TnhfmsLn+O6VTPdy87hrzL4E
         WLtw==
X-Gm-Message-State: AOAM533Z5fgztaor2RnfmfUNfIq3VIHzApi77duTOfkTyC6FQjxcJ7z0
        +QLWTgARX5+r/SjysZUebJKCEHpT/xrg5ycNZKmscjYeQ03Nh46Abj1fNt70vk9jt6F4SJ1hPg4
        nH00lZDa3nD7PNNwyrLw=
X-Received: by 2002:a17:902:a988:b0:158:9877:6c2c with SMTP id bh8-20020a170902a98800b0015898776c2cmr28267071plb.80.1652322859737;
        Wed, 11 May 2022 19:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH1llvd8fk2D0SYmSmCKYC9uAr2o+Ctxa0UAZPqI0TRSxNPoWV0eswyAEUVKhnU6msW55asw==
X-Received: by 2002:a17:902:a988:b0:158:9877:6c2c with SMTP id bh8-20020a170902a98800b0015898776c2cmr28267045plb.80.1652322859494;
        Wed, 11 May 2022 19:34:19 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7810f000000b0050dc762812dsm2464432pfi.7.2022.05.11.19.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 19:34:19 -0700 (PDT)
From:   Coiby Xu <coxu@redhat.com>
To:     kexec@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Mimi Zohar <zohar@linux.ibm.com>, Chun-Yi Lee <jlee@suse.com>,
        stable@vger.kernel.org, Philipp Rudo <prudo@linux.ibm.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        linux-s390@vger.kernel.org (open list:S390),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 4/4] kexec, KEYS, s390: Make use of built-in and secondary keyring for signature verification
Date:   Thu, 12 May 2022 10:34:02 +0800
Message-Id: <20220512023402.9913-5-coxu@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512023402.9913-1-coxu@redhat.com>
References: <20220512023402.9913-1-coxu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Michal Suchanek <msuchanek@suse.de>

commit e23a8020ce4e ("s390/kexec_file: Signature verification prototype")
adds support for KEXEC_SIG verification with keys from platform keyring
but the built-in keys and secondary keyring are not used.

Add support for the built-in keys and secondary keyring as x86 does.

Fixes: e23a8020ce4e ("s390/kexec_file: Signature verification prototype")
Cc: stable@vger.kernel.org
Cc: Philipp Rudo <prudo@linux.ibm.com>
Cc: kexec@lists.infradead.org
Cc: keyrings@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Reviewed-by: "Lee, Chun-Yi" <jlee@suse.com>
Acked-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/s390/kernel/machine_kexec_file.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index 8f43575a4dd3..fc6d5f58debe 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -31,6 +31,7 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
 	struct module_signature *ms;
 	unsigned long sig_len;
+	int ret;
 
 	/* Skip signature verification when not secure IPLed. */
 	if (!ipl_secure_flag)
@@ -65,11 +66,18 @@ int s390_verify_sig(const char *kernel, unsigned long kernel_len)
 		return -EBADMSG;
 	}
 
-	return verify_pkcs7_signature(kernel, kernel_len,
-				      kernel + kernel_len, sig_len,
-				      VERIFY_USE_PLATFORM_KEYRING,
-				      VERIFYING_MODULE_SIGNATURE,
-				      NULL, NULL);
+	ret = verify_pkcs7_signature(kernel, kernel_len,
+				     kernel + kernel_len, sig_len,
+				     VERIFY_USE_SECONDARY_KEYRING,
+				     VERIFYING_MODULE_SIGNATURE,
+				     NULL, NULL);
+	if (ret == -ENOKEY && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
+		ret = verify_pkcs7_signature(kernel, kernel_len,
+					     kernel + kernel_len, sig_len,
+					     VERIFY_USE_PLATFORM_KEYRING,
+					     VERIFYING_MODULE_SIGNATURE,
+					     NULL, NULL);
+	return ret;
 }
 #endif /* CONFIG_KEXEC_SIG */
 
-- 
2.35.3

