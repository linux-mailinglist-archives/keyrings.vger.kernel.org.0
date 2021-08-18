Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD18A3F0DE2
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 00:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbhHRWJK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 18:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbhHRWJJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 18:09:09 -0400
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0298C061764;
        Wed, 18 Aug 2021 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
        s=42; h=Message-ID:Cc:To:From:Date;
        bh=Ju/dpIFvvmJW3Fub8AWFitRq1oXbAkBfTKObVumNQi8=; b=G7rncJVIF5nbFsZfhGeDFC/CU0
        bRDH6v3YqRj34n3iYxdqIkJQW1xOhqPFfHBHm5RTVgWPIIbYV8dk9UgY08gWaqIDMo4esX7ZdUYK4
        1WRbkNzB4h7tkgcEMlEtEBgSy3JTL2zthqNx2uu+XJ8BvKiprY/fCsaNfPOAFwmFOiHiQ7U0b/BWC
        H9WIAzWl/Wpi9ChcsX0wFeqBBIUcakViTNNlVLt0ImXo8pEYFJXUKjNBYUSex7jIPyrnCDwpyg5Hb
        +q8pLSgtgU+EFb6iMVpre9oSYcCVKN7eig77/m1kJQarZs25IsKHCx52ap1St+rq8TNjAPrjjRYxS
        c1ywXgyVf9By1fBd/2tktGPR+dGH56kIB+2La1LSnKw7+E43BTZVJvEJqX8fU8oBCvG+SUv6Nr5NT
        hj2ad5Nr0ZxymPmaf09lN/6wTH4jIJ3L1l+feGMMQm7Sh9O9V9Y0nLyvnhIlPfaBVWi11xx2HqjYv
        6RcE8Mxv1fSXt/UgUHJTvRAi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
        by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
        (Exim)
        id 1mGTjZ-001yez-6y; Wed, 18 Aug 2021 22:08:29 +0000
Date:   Wed, 18 Aug 2021 15:08:24 -0700
From:   Jeremy Allison <jra@samba.org>
To:     Steve French <smfrench@gmail.com>
Cc:     Denis Kenzior <denkenz@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        samba-technical <samba-technical@lists.samba.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Steve French <sfrench@samba.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
Message-ID: <YR2E2FZNdMj2xl+0@jeremy-acer>
Reply-To: Jeremy Allison <jra@samba.org>
References: <20210818144617.110061-1-ardb@kernel.org>
 <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
 <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
 <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Aug 18, 2021 at 11:47:53AM -0500, Steve French via samba-technical wrote:
>I don't object to moving ARC4 and/or MD4 into cifs.ko, but we do have
>to be careful that we don't make the defaults "less secure" as an
>unintentional side effect.
>
>The use of ARC4 and MD4 is the NTLMSSP authentication workflow is
>relatively small (narrow use case), and NTLMSSP is the default for
>many servers and clients - and some of the exploits do not apply in
>the case of SMB2.1 and later (which is usually required on mount in
>any case).
>
>There is little argument that kerberos ("sec=krb5") is more secure and
>does not rely on these algorithms ... but there are millions of
>devices (probably over 100 million) that can support SMB3.1.1 (or at
>least SMB3) mounts but couldn't realistically join a domain and use
>"sec=krb5" so would be forced to use "guest" mounts (or in the case of
>removing RC4 use less secure version of NTLMSSP).
>
>In the longer term where I would like this to go is:
>- make it easier to "require Kerberos" (in module load parameters for cifs.ko)
>- make sure cifs.ko builds even if these algorithms are removed from
>the kernel, and that mount by default isn't broken if the user chooses
>to build without support for NTLMSSP, the default auth mechanism (ie
>NTLMSSP being disabled because required crypto algorithms aren't
>available)
>- add support in Linux for a "peer to peer" auth mechanism (even if it
>requires an upcall), perhaps one that is certificate based and one
>that is not (and thus much easier to use) that we can plumb into
>SPNEGO (RFC2478).    By comparison, it sounds like it is much easier
>in Windows to add in additional authentication mechanisms (beyond
>Kerberos, PKU2U and NTLMSSP) - see
>https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj852232(v=ws.11)
>so perhaps we just need to do something similar for the kernel client
>and samba and ksmbd where they call out to a library which is
>configured to provide the SPNEGO blobs for the new stronger
>peer-to-peer authentication mechanism the distro chooses to enable
>(for cases where using Kerberos for authentication is not practical)

My 2 cents. Preventing NTLM authentication/signing from working would be
a negative for the Linux kernel client. I don't mind if that code has
to be isolated inside cifs.ko, but it really needs to keep working,
at least until we have a pluggable client auth in cifs.ko and Samba
that allows the single-server (non AD-Domain) case to keep working
easily.
