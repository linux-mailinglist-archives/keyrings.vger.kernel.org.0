Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61A92F8224
	for <lists+keyrings@lfdr.de>; Fri, 15 Jan 2021 18:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732139AbhAORWe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 12:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbhAORWd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 Jan 2021 12:22:33 -0500
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9F7C061794;
        Fri, 15 Jan 2021 09:21:53 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 52C0912806CB;
        Fri, 15 Jan 2021 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1610731313;
        bh=eVzompidzUYaKPM2zxaqKrfZo1Iu4LvdVyHg60ED2NQ=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=WVocnMLZzbCjnSOMORE5QuohV98hVmsC4Hz/QWR/W0oTeUIUqdCf6p0EDHmKngv1X
         MpZlmnGnKPoCZOn+tbGrT62KYgsVHkSlMFopjgRL9OkH8K3qqkgmLdnTT0vYMpA2MH
         oRhKJLIcx0zoCS9K0e6M5lGwWIl0sw4g1JBs+BPU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zZuRvVCurBjz; Fri, 15 Jan 2021 09:21:53 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 83A4412806BA;
        Fri, 15 Jan 2021 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1610731313;
        bh=eVzompidzUYaKPM2zxaqKrfZo1Iu4LvdVyHg60ED2NQ=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=WVocnMLZzbCjnSOMORE5QuohV98hVmsC4Hz/QWR/W0oTeUIUqdCf6p0EDHmKngv1X
         MpZlmnGnKPoCZOn+tbGrT62KYgsVHkSlMFopjgRL9OkH8K3qqkgmLdnTT0vYMpA2MH
         oRhKJLIcx0zoCS9K0e6M5lGwWIl0sw4g1JBs+BPU=
Message-ID: <0659f965b3321e793fee03136ae50cbbcd4a53bf.camel@HansenPartnership.com>
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>, dhowells@redhat.com,
        dwmw2@infradead.org, jarkko.sakkinen@linux.intel.com
Cc:     herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        zohar@linux.ibm.com, erichte@linux.ibm.com, mpe@ellerman.id.au,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org
Date:   Fri, 15 Jan 2021 09:21:51 -0800
In-Reply-To: <20200916004927.64276-1-eric.snowberg@oracle.com>
References: <20200916004927.64276-1-eric.snowberg@oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2020-09-15 at 20:49 -0400, Eric Snowberg wrote:
> The Secure Boot Forbidden Signature Database, dbx, contains a list of
> now revoked signatures and keys previously approved to boot with UEFI
> Secure Boot enabled.  The dbx is capable of containing any number of
> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and
> EFI_CERT_X509_GUID entries.
> 
> Currently when EFI_CERT_X509_GUID are contained in the dbx, the
> entries are skipped.
> 
> Add support for EFI_CERT_X509_GUID dbx entries. When a
> EFI_CERT_X509_GUID is found, it is added as an asymmetrical key to
> the .blacklist keyring. Anytime the .platform keyring is used, the
> keys in the .blacklist keyring are referenced, if a matching key is
> found, the key will be rejected.
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>

If you're using shim, as most of our users are, you have no access to
dbx to blacklist certificates.  Plus our security envelope includes the
Mok variables, so you should also be paying attestion to MokListX (or
it's RT equivalent: MokListXRT).

If you add this to the patch, we get something that is mechanistically
complete and which also allows users to add certs to their Mok
blacklist.

James


