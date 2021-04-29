Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4C336EFB2
	for <lists+keyrings@lfdr.de>; Thu, 29 Apr 2021 20:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbhD2Sus (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Apr 2021 14:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241017AbhD2Sus (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Apr 2021 14:50:48 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D74C06138B
        for <keyrings@vger.kernel.org>; Thu, 29 Apr 2021 11:50:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0B97512801CA;
        Thu, 29 Apr 2021 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1619722201;
        bh=wEjfE4lIinf9SXRuRbvGmI08ysi1L2vY1LSbB/5L9YE=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=j28wLWCn1/0mbev+GX1PpmHfeukWwMwj+jMMjxxPvq5oK2vlcGiKjSzBdD5SDvZ0S
         7UFS35WYGG+L0roG07yl4NmEGK0h2dz6bxwSX6ECExyqPSDHzkPJv5QW/AReTlZkAw
         M4MVn51ey92buFbe2aNyCPujO2JvRJSkPSivwEp0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LBuTuY3I833J; Thu, 29 Apr 2021 11:50:01 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id BE4C0128017C;
        Thu, 29 Apr 2021 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1619722200;
        bh=wEjfE4lIinf9SXRuRbvGmI08ysi1L2vY1LSbB/5L9YE=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=v8HyTXFJTBGvtzOX9ErWhn/ld7tRxy2glVMk/urAOnZJjQM6Wfr6XMHA1rbe4S3IA
         05OlOWOHcQPlAByIoVNVpLAd5L5ZYZ5WQAqP6WFldTZDY/keXluqvp++GEc1MxLl4Z
         1cOdrIqXx1PiMD1uUwxSQVfkT0gHv+V4QRVrBNY4=
Message-ID: <8aee4e2ceadc197ad0bd8c452e21ea17c7682b4f.camel@HansenPartnership.com>
Subject: Re: [bug report] security: keys: trusted: use ASN.1 TPM2 key format
 for the blobs
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     keyrings@vger.kernel.org
Date:   Thu, 29 Apr 2021 11:50:00 -0700
In-Reply-To: <YIpV9pcyM9/rWqEt@mwanda>
References: <YIpV9pcyM9/rWqEt@mwanda>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2021-04-29 at 09:45 +0300, Dan Carpenter wrote:
> Hello James Bottomley,
> 
> The patch f2219745250f: "security: keys: trusted: use ASN.1 TPM2 key
> format for the blobs" from Jan 27, 2021, leads to the following
> static checker warning:
> 
> security/keys/trusted-keys/trusted_tpm2.c:344 tpm2_seal_trusted()
> warn: inconsistent returns '&chip->ops_sem'.
>   Locked on  : 339
>   Unlocked on: 258,344
> security/keys/trusted-keys/trusted_tpm2.c:344 tpm2_seal_trusted()
> warn: inconsistent returns '&chip->tpm_mutex'.
>   Locked on  : 339
>   Unlocked on: 258,344
> 
> security/keys/trusted-keys/trusted_tpm2.c
>    324  
>    325          blob_len = tpm2_key_encode(payload, options,
>    326                                     &buf.data[TPM_HEADER_SIZE
> + 4],
>    327                                     blob_len);
>    328  
>    329  out:
>    330          tpm_buf_destroy(&buf);
>    331  
>    332          if (rc > 0) {
>    333                  if (tpm2_rc_value(rc) == TPM2_RC_HASH)
>    334                          rc = -EINVAL;
>    335                  else
>    336                          rc = -EPERM;
>    337          }
>    338          if (blob_len < 0)
>    339                  return blob_len;
>                         ^^^^^^^^^^^^^^^^
> Need to call tpm_put_ops() or something before returning.
> 
>    340  
>    341          payload->blob_len = blob_len;
>    342  
>    343          tpm_put_ops(chip);
>    344          return rc;
>    345  }

Yes, you're right.  The best fix seems to be the below so as not to add
more error legs with puts.

James

---

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index d225ad140960..cbf2a932577b 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -336,9 +336,9 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 			rc = -EPERM;
 	}
 	if (blob_len < 0)
-		return blob_len;
-
-	payload->blob_len = blob_len;
+		rc = blob_len;
+	else
+		payload->blob_len = blob_len;
 
 	tpm_put_ops(chip);
 	return rc;

