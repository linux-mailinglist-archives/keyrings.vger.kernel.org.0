Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87F221D5D27
	for <lists+keyrings@lfdr.de>; Sat, 16 May 2020 02:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEPATw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 20:19:52 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49525 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726550AbgEPATw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 20:19:52 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 6926A79F;
        Fri, 15 May 2020 20:19:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 15 May 2020 20:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:reply-to:mime-version
        :content-type; s=fm1; bh=t4rmkcEc6NfVkbuzlOO+Xmjpt1G9Z6Csn9qHJOD
        KOOg=; b=SHe15J0TMnIzqp6k7uFxiTKKuBx1IMFBtx13+XhE5ON+q74BAxDO54o
        IF27Fqht7pTBryKgYtfPNu4hBtWqC/lWwbyuYm+Dc/cKwZnGk69C69Ad0/G/tNhK
        ID4DANKED5Qgw1BVzx91+EfVlutinDlwRrlgqvXGWBgooDFFWoHx30XE8Y3k1zs9
        slVoS0w3SySYxlMrr1VyVqMfse9oBtn51pQOtisT681Q42WbiqqoH7SkF9Q9ghzO
        26+HzIxxNVBFpSPBv8V0vm9nPChF7p+5npT6zm9sUrJk0uCTbtVKZKTLlgdUbwqO
        KZSKKtlviqBqGMGVvTEwgq055IwddpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:reply-to:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=t4rmkcEc6NfVkbuzl
        OO+Xmjpt1G9Z6Csn9qHJODKOOg=; b=2Wg/GQ56vYXdWlrFWhmtZ2UcaQbdPkmLO
        /9WLbIfYLRdpy70nocfK0HLV5AMvUkP3apvMhsZ8XicHTYqSFb9jKyPhlNrT3Bxx
        M7M5G3KbtG+PqxM5a9ApjEnfFoONXZQEmA+kNo28yEm4HTOVsgtQ4vdLLMNB9762
        OvjenCCt6u79O5/AULQ3gbDDux2sJkrz0g/Tnw59P+5JHsH9rj3aGA1rjJ3yqytc
        UvT/0ySmM7VDr+8MV9nB4RmT2eBLfZv5IfYLK8WyY5X8Mt4KVZJ/WvhFw6BCJyR6
        OC1IaESGr84r2LPNL9BoufBSyqvjnSOdLO9j3bE7OTbb/AGDGNsmg==
X-ME-Sender: <xms:pjG_XmiULLNWgpr9qKhdQ0HMp0nE7BtM0kS8y_6aMHDNkMKHF8u0mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleelgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhrgggtuggfsehttdertd
    dtreejnecuhfhrohhmpeeuvghnuceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgv
    lhdrnhgvtheqnecuggftrfgrthhtvghrnheptddtjeelgeefuedvffekvdeuhfdugeehfe
    ffjeefjeeuveffuedthfevieeljeehnecukfhppeeiledrvddtgedrudeikedrvdeffeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessg
    gvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:pjG_XnC8Jp9vonGFRo5K36yaCM1FMqLk0lPA1Inp7P4zPPE7LkjMiA>
    <xmx:pjG_XuEza1--aWRqopAjz2M0e-RgIS8whntD0eszSlL97qeAYNGSaQ>
    <xmx:pjG_XvSokCdon_IXM1OCMuNNC5UzqLAbW4mvcj5r-W6zvbT9qSMc4g>
    <xmx:pzG_Xi8kRGA075mz6K4YlKoD56XgITcd27r3i6Ims0kEqgVwvLLN9w>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8AFED328005E;
        Fri, 15 May 2020 20:19:50 -0400 (EDT)
Date:   Fri, 15 May 2020 20:19:49 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com
Subject: keyctl_pkey_decrypt / keyctl_pkey_encrypt size mismatch?
Message-ID: <20200516001949.GA1034557@erythro.dev.benboeckel.internal>
Reply-To: me@benboeckel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.13.3 (2020-01-12)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

I'm looking at `keyctl_pkey_decrypt` and I see its call in libkeyutils
is:

	out = malloc(result.max_enc_size);
	if (!out)
		error("malloc");

	out_len = keyctl_pkey_decrypt(key, info,
				      in, in_len, out, result.max_enc_size);

`keyctl_pkey_encrypt` uses `max_dec_size` too. The kernel docs mention
these fields as:

     ``max_*_size`` indicate the maximum sizes in bytes of a blob of data to be
     signed, a signature blob, a blob to be encrypted and a blob to be
     decrypted.

which would make me think that the code is wrong since I read this as
`max_enc_size` is the maximum to-be-encrypted size, not the max size for
a decryption result buffer.

However, it would seem the code actually works since such a buffer
length mismatch seems like *someone* would have made some noise. Some
investigation shows that it could be coincidence as both lengths are
acutally the same[1] (in at least some cases). Unfortunately, no pkey
tests exist in libkeyutils, so the documentation could just be unclear.
Should the documentation instead spell out each `max_X_size` entry
explicitly and list their usage in "respectively" order or get a new
paragraph for each? Or is this just a bug in libkeyutils?

Thanks,

--Ben

[1]See the commit message in c08fed73712620eb0a19244dbbbbdf00edbe5e47:

    # keyctl pkey_query $j - enc=pkcs1
    key_size=4096
    max_data_size=512
    max_sig_size=512
    max_enc_size=512
    max_dec_size=512
    encrypt=y
    decrypt=y
    sign=y
    verify=y
