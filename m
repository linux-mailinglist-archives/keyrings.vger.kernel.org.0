Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2303382F0
	for <lists+keyrings@lfdr.de>; Fri, 12 Mar 2021 01:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhCLA4L (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 19:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCLAzg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 19:55:36 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8A1C061760
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 16:55:36 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id l13so2643346qtu.9
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 16:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:in-reply-to:references:mime-version
         :content-transfer-encoding:date:message-id;
        bh=w3ezRd8mrL0vAlCG9mcLso4UK6wUF99UVQ05HbiwLYY=;
        b=kiJZeSikOkc8czMLKzeWH9ffmzDLvThbUaeVZz1bKAtKLUNvHQ26mJuveGVN2FK8mG
         1roAJcxVD6dJA4a0z9oPYs4EMv6mdv0xou/NGvGnOsA7rVS/FAR4FMPa+RxQxx786GBQ
         VwJE9cehe+p/0hOSm4vN8oYb7P0J63PlxPcEjdUwBpJumQQCCkD/eT/TOB+ndF9SaTn7
         kahOG2u7YU5ryUai6AXQqBQYg2K76m9sgzm1zeSh0ma7kUg4gj0/dulG1m7VlN7hwngt
         OG0qE5q4dzcK/9Ul++OYo1aAWQd8Zevzw9vSSmKMONREyoiSh3e4DjglevUKPkpwkXMW
         zNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=w3ezRd8mrL0vAlCG9mcLso4UK6wUF99UVQ05HbiwLYY=;
        b=sYVzzQXyqRxAL+trnWmALwJqyMJjjqKNJ+ND/jGnJZBtCGHkRDgSsqiZ+I90nrY7Vj
         2wEre7wfW2X8bJe3zWMwToq7Uebo8YOGWu+Wv3jX26w1UpkkLHoV0H+0XOal3fyZjDhQ
         yesId9zNwB2YeL/MIkR8nCAd3g2ZJfDOWeK7wfGgRylgjRAYVtM/Vg7+mS4hAEoZyms5
         PIl63Ebfl3eC3SCEgbWCMNcgODJUe/Ol1u+DiAiv50BFEq9CtvBxqwMh5UbmpSLk4v4G
         DIC71x6wP0wpvCXWWdF2+lFrBwKJQhzlE9pwzfwBNJsdg2F+Bg24k5qzozPcXZ7Ocy32
         uvsw==
X-Gm-Message-State: AOAM532BtXRfMmo86Xal/5j2llqWeIlefqejmGIsw0em1opKZAFs2kh7
        6OBmR5lgiV9HWjzZWFjXYZlCbw==
X-Google-Smtp-Source: ABdhPJyvsGA5BrK/amG59j1KL/mhguJcprjIbfsfNg87KvAlJcryJ3NOfIJR+JDOSfinplM+cZl2sg==
X-Received: by 2002:ac8:6909:: with SMTP id e9mr9580752qtr.291.1615510535640;
        Thu, 11 Mar 2021 16:55:35 -0800 (PST)
Received: from turing-police ([2601:5c0:c380:d61::359])
        by smtp.gmail.com with ESMTPSA id d70sm3349298qkg.30.2021.03.11.16.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:55:35 -0800 (PST)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     David Howells <dhowells@redhat.com>
Cc:     David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
In-Reply-To: <1486567.1615464259@warthog.procyon.org.uk>
References: <109018.1615463088@turing-police> <91190.1615444370@turing-police> <972381.1615459754@warthog.procyon.org.uk>
 <1486567.1615464259@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1615510534_20296P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 19:55:34 -0500
Message-ID: <134696.1615510534@turing-police>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--==_Exmh_1615510534_20296P
Content-Type: text/plain; charset=us-ascii

On Thu, 11 Mar 2021 12:04:19 +0000, David Howells said:

> 	EXTRACT_CERTS   /usr/src/linux-next/"certs/signing_key.pem"
>
> but I don't know why.  There are some odd quotes in your line also which may
> be related to the problem.  The relevant config line looks the same:
>
> 	CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"

Aha.  I figured it out.

If you have a *totally* clean source tree, 'make -O' works for all users.
If you have in the past done a build in the tree, and then done a 'make mrproper'
to clean it out so 'make -O' doesn't complain, it fails because it
finds an *old* certs/signing_key.pem in /usr/src/linux-next and tries to
put the new generated files in the same directory.

So the root cause was: 'make mrproper doesn't clean certs/' out enough,
and this chunk of certs/Makefile

# If CONFIG_MODULE_SIG_KEY isn't a PKCS#11 URI, depend on it
ifeq ($(patsubst pkcs11:%,%,$(firstword $(MODULE_SIG_KEY_FILENAME))),$(firstword $(MODULE_SIG_KEY_FILENAME)))
X509_DEP := $(MODULE_SIG_KEY_SRCPREFIX)$(MODULE_SIG_KEY_FILENAME)
endif

MODULE_SIG_KEY_SRCPREFIX was where my /usr/src/linux-next was coming from...

I admit not being sure how (or if) this should be fixed




--==_Exmh_1615510534_20296P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYEq8BQdmEQWDXROgAQKRsQ//QSElUxJzHZdEgOtQv8I7u83Unzhk7zf4
6m4Oz5J40dYCv38GNPCqW3Pq8Gu2ebxjGsjfuOeqG8lZRnAnp4WXgrkrk++uYEef
BgdqtP07VF0c1/11YjDtpheoa5X90IFCM+/MNpW6NtgznsATvu8BXtKp4BaU0ZYk
7rFk7hSV5FNFmcO7djPfZIdRrnwVCWm976PyL+hvb6bsMdVQhPr0+BEe1d/3Sthk
oTtFpHK7NpFA6vpyegiCccpKplUfTyo//PWgnFX1nbiw0rYL9TuGAWsEjqD0ZYTP
iGlbZVyC+PJGIWj/NRYko9OegbPuLlDZEvM6qtB0CRmvIagHWi8ZLnFEr74FensE
d6DikoR6rsktqGFV8AwQT2LwOzxOuI/vQKK7Ku38aPKDPz2NuxGr10ULSK/sVPkg
tN3sVqOJs4UpX2PIiGNIEe/TAxM6X9H3U16MpkCcnqxayXCRvM4uKO/U4Qp0zxz9
w6jhG81RHLjUcjZWahwZJaBLbSAlVzJlD/WzjpGTorye65/OHByOHjB+ao2dZDEz
I5bj/I3EQtxnNOUodmF/i24lMqufqW4usth0wn8D8zxQC1YeN6SbJvBsn25wJANF
6w3N2BXp25uTb8gb70UJ2XAYrE4J0cZxipJaI6y5z2/MmyJqgtK7p+iD0AfvTGv3
Qk/MmHbwdNU=
=aW+D
-----END PGP SIGNATURE-----

--==_Exmh_1615510534_20296P--
