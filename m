Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D036E503
	for <lists+keyrings@lfdr.de>; Thu, 29 Apr 2021 08:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhD2GqK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Apr 2021 02:46:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:34534 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238950AbhD2GqJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Apr 2021 02:46:09 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T6UENP077017;
        Thu, 29 Apr 2021 06:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=MYrHmjtF9T1eVTcrooB6Uv3/JzEpCF95vYix1bR3a/Y=;
 b=b5D8y7bBD4iBLwkMTWtIKJV9N5J95mBJNrqK20Z+7nlmWVLiPfFrp5m//DpHNv7JxUJJ
 anSyO6/V2nSXdnStddQ+csPDGkYHD8I10my6nGSWJd0m7h0qPzrzn/zVzFyisR5wVAFo
 aOiSiT+BhKx3pGf2bmokT/THxYtGtY0ikqnoQgtAnpBKbLzADXFlE3XT5sK3wAW22Yr6
 JkgRk5L7er3CWdzYjMVoovM1mBi+umTfuBFsmASerle1ms4zsiM75fgYZnEqOvTmmmpQ
 U4tTZdfK2esR16cO+9DtoW365my9YFbnLfO7jUounXF8mJjTBBtnOdj/eWWoKovnKifs HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 385ahbu6c0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 06:45:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T6Urxe074703;
        Thu, 29 Apr 2021 06:45:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 3848f0mp25-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 06:45:20 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13T6eqTT103974;
        Thu, 29 Apr 2021 06:45:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 3848f0mp1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 06:45:20 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13T6jGSw027916;
        Thu, 29 Apr 2021 06:45:19 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 28 Apr 2021 23:45:16 -0700
Date:   Thu, 29 Apr 2021 09:45:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     James.Bottomley@hansenpartnership.com
Cc:     keyrings@vger.kernel.org
Subject: [bug report] security: keys: trusted: use ASN.1 TPM2 key format for
 the blobs
Message-ID: <YIpV9pcyM9/rWqEt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: M5MJ--YlzJokHdJW3ovtWGzTiFGqc9TT
X-Proofpoint-ORIG-GUID: M5MJ--YlzJokHdJW3ovtWGzTiFGqc9TT
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=636
 priorityscore=1501 clxscore=1011 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290050
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello James Bottomley,

The patch f2219745250f: "security: keys: trusted: use ASN.1 TPM2 key
format for the blobs" from Jan 27, 2021, leads to the following
static checker warning:

security/keys/trusted-keys/trusted_tpm2.c:344 tpm2_seal_trusted() warn: inconsistent returns '&chip->ops_sem'.
  Locked on  : 339
  Unlocked on: 258,344
security/keys/trusted-keys/trusted_tpm2.c:344 tpm2_seal_trusted() warn: inconsistent returns '&chip->tpm_mutex'.
  Locked on  : 339
  Unlocked on: 258,344

security/keys/trusted-keys/trusted_tpm2.c
   324  
   325          blob_len = tpm2_key_encode(payload, options,
   326                                     &buf.data[TPM_HEADER_SIZE + 4],
   327                                     blob_len);
   328  
   329  out:
   330          tpm_buf_destroy(&buf);
   331  
   332          if (rc > 0) {
   333                  if (tpm2_rc_value(rc) == TPM2_RC_HASH)
   334                          rc = -EINVAL;
   335                  else
   336                          rc = -EPERM;
   337          }
   338          if (blob_len < 0)
   339                  return blob_len;
                        ^^^^^^^^^^^^^^^^
Need to call tpm_put_ops() or something before returning.

   340  
   341          payload->blob_len = blob_len;
   342  
   343          tpm_put_ops(chip);
   344          return rc;
   345  }

regards,
dan carpenter
