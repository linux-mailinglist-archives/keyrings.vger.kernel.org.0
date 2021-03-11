Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E6C336C4D
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 07:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhCKGdT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 01:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhCKGcx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 01:32:53 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0962BC061574
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 22:32:53 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id r14so404444qtt.7
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 22:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:mime-version:content-transfer-encoding
         :date:message-id;
        bh=BizFYMd4lnfnBCNV1I/csBONi2AAiqpb4n7PCn9WcW8=;
        b=DzhYAAvXKF93EBOHLTIeuCFiN2xnFJkBMayInq9r9s4V5WwKwrhefz1OLvDmsAqPIG
         mPSJXZgAWKIXuBhn6PCHMWKW0Hj92SNEljy5tsuIa7Q1aTR1V4GEZYw55e8AHBC7gnmK
         tbxYAIr2z30giHd30rMn945CxEiVK1LP6Sa/kXkYObC54RfL6nf2UA4vaHDx2SKnw6sV
         F0e+C46e7Tv2WQ7AAV2NTLgyIoKjaGW1pLDKY7ri8K9E7+b9jz725cRFcz6LxLY+kogh
         lfY4cvIcYHC43ZbYnWgmIgO5nvH8fUQeIlO1fTDr8VV0dAITs6TO2cY8a7TS21ztjEdL
         xWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version
         :content-transfer-encoding:date:message-id;
        bh=BizFYMd4lnfnBCNV1I/csBONi2AAiqpb4n7PCn9WcW8=;
        b=o5Ntr+kYDioquGz9IJGEoxQhMvw2OvpCIH89bhXavJc6Xegb5BIE7QHL7uR7EKnDgx
         2+05x4CMD9xrekJ55pWZJPhK0YUU94R199qngG98+RZkDY+jwyJaRvEOygqAJHPHCsaq
         PeX9G6lnLlqzLOJQwWll5gYkM0TBBqa5SgCooB3YzV6Phtuq0FGmXHo2ML4lcFm5q/21
         9GCHkgrkeie4eYyeLEuS+jiWT6KJRvLeHcYQSGFKfv/lesKaaqF79I0WBIBitKYv95jt
         BdmM5nxYLbrd8/hBm9ImYDjbURruZlkw0lj++TP5OTgxSZcPYWLLCwx7Pb+kB0zfGTtW
         K7YA==
X-Gm-Message-State: AOAM53265hxsw7yMjvpWG1h2/iMV5majhx7rqVyHpQMsnacn+0JTkrz1
        kOa99fygUd8m8gW0sf3KJqFrWiPfoDtcWg==
X-Google-Smtp-Source: ABdhPJxo9JCV0i430aeowSbupXwCUIw61RVhNtF1B9UvTEK16su2H+ORwzLBs+/eyCNbi9dDAiKzKg==
X-Received: by 2002:ac8:7153:: with SMTP id h19mr6367855qtp.176.1615444372117;
        Wed, 10 Mar 2021 22:32:52 -0800 (PST)
Received: from turing-police ([2601:5c0:c380:d61:2b0f:e860:4e22:d54f])
        by smtp.gmail.com with ESMTPSA id d10sm1108163qtq.78.2021.03.10.22.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 22:32:51 -0800 (PST)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: 'make O=' indigestion with module signing
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1615444370_76436P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 01:32:50 -0500
Message-ID: <91190.1615444370@turing-police>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--==_Exmh_1615444370_76436P
Content-Type: text/plain; charset=us-ascii

So, I tried doing a 'make O=... allmodconfig', with a setup where the uid of
the build process had write permission to the O= directory, but intentionally
did *not* have write permission to the source tree (so they couldn't mess up
the tree - I got tired of having to repeatedly do 'make mrproper' because of
pilot error)

allmodconfig gave me a .config that had:

CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_FORCE=y
CONFIG_MODULE_SIG_ALL=y
CONFIG_MODULE_SIG_SHA1=y
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha1"
CONFIG_IMA_APPRAISE_REQUIRE_MODULE_SIGS=y
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"

What i *expected* was that multiple builds with different O= would each
generate themselves a unique signing key and put it in their own O= directory
and stay out of each other's way.

What actually happened:

  EXTRACT_CERTS   /usr/src/linux-next/"certs/signing_key.pem"
At main.c:142:
- SSL error:0200100D:system library:fopen:Permission denied: ../crypto/bio/bss_file.c:69
- SSL error:2006D002:BIO routines:BIO_new_file:system lib: ../crypto/bio/bss_file.c:78
extract-cert: /usr/src/linux-next/certs/signing_key.pem: Permission denied
make[2]: *** [/usr/src/linux-next/certs/Makefile:106: certs/signing_key.x509] Error 1
make[1]: *** [/usr/src/linux-next/Makefile:1847: certs] Error 2
make[1]: Leaving directory '/usr/src/linux-next/out/arm64'
make: *** [Makefile:215: __sub-make] Error 2

It tried to put the key into the source tree rather than the build tree.

Before I try to code up a fix for this, is this intentionally designed
behavior, or have I just managed to trip over a rarely-tested corner case?

--==_Exmh_1615444370_76436P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYEm5kgdmEQWDXROgAQKR7A//a5ygFNNhhw7c953h2Tz4djYPSGEgBOLV
nPyT9ZRRU0cmaZjw3bCfZNfP5BBioFDrvN0vYjopP2eZ8yJXJ/qFB9oST8eu4YsO
BFTvRglMsvwDvHoKORM0jUkxFgsIwK6IficTZldx1h//4+frT4LkxLaAVWCZOGa2
yWnHT2xGPXpirlTy3EuQR9oseshC4NYw2unGAVQ69t8e55uAmGCST3pe5zuBuSOb
2WDEnxdU7A0hyWIlmwRZvKPUPZvl2K5eM5C1+9PDB/0KLJ0mouJBxP48x5yUw3Ci
0V4YYDtnGRXNYniJeX0eaqIWX/Pkx+Z/PVjWR+Ys4U+z6eZuMMVCIyw3wfBsprSj
kPz0KXxpShMfmkIdwH0piZNwd+4axDM1akgOp8PHkI5uuhOw8pxanqIy7uLB/E0j
9Og5LlnuVDa4bawYD4+iAjdelcA98CbWaORB2cmG9/uI+1VSi75uWYAa2VIRokGm
yTWVXtuJq/2JCviF6hF6HMxXkxhUQKn2P71fzhPqVSnlUb+duAnpOBB1P07LjMyq
LfWKdrTl+mSt4r2XICnWilozkwkMb3Uq2VB2CF5JSJmjM1dXt/sMC9hTxEHr/MAZ
wf0Z6DF3iBqDDQ6sQ0jFrOxWdifGyOAjE2iscqJ7gyH0WkM5+q9OTpGHBglqM6lL
QuGzzjsLpxE=
=TNNH
-----END PGP SIGNATURE-----

--==_Exmh_1615444370_76436P--
