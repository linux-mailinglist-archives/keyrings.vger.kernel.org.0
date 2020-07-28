Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4D123085E
	for <lists+keyrings@lfdr.de>; Tue, 28 Jul 2020 13:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbgG1LGm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 Jul 2020 07:06:42 -0400
Received: from mout.gmx.net ([212.227.15.19]:56479 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728752AbgG1LGl (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 28 Jul 2020 07:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595934396;
        bh=BBf0UvXGjTyaPznNw9ByOqvjGJARv+YXQFpffHbqHfU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=gM2/S1bqlUVpuqPJ4uefcHuvzazKsgodJdEqu/t8B8FiMwpNNkh7UZv4psc8gRjLy
         hOpzEkwfoIh+QoR8OyONHIJK9qAPnmBJ46ZUZDP+D1MIlRzJ4xctMNmQ2ifvIYmuKk
         QN9Z7bg+wvbKO62US8O3UMl77MQHxcQIKLP4vYAo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([217.251.132.217]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1kuPbT2GuB-00u0yO; Tue, 28
 Jul 2020 13:06:36 +0200
Date:   Tue, 28 Jul 2020 13:06:35 +0200
From:   Marcus =?utf-8?B?SMO8d2U=?= <suse-tux@gmx.de>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH] keys: Do not check the retval of commit_creds in
 join_session_keyring
Message-ID: <20200728110635.rlvzizbsrcddhzj2@linux>
References: <c8ccba0bbcb9147fb220fd18b3b5e1e951b6d5fd.1591960478.git.suse-tux@gmx.de>
 <20200617014613.GA7215@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617014613.GA7215@linux.intel.com>
X-Provags-ID: V03:K1:/fcsYZH6vQy2TMrMUXI+/Oa9cKuO/xsDF/aGMOvueLdff0Rscmt
 JEoFvOcW2AakkXvfDgbI1dPu+org4viydiO8JbpPCp33vN6iNHLxroc/heji9ojP5WxEsmQ
 Oes69e29t6nioA4tFKTCE3Ivl/QN9iblgCGrZK5iYIE6LTeut9M0fnX3/RiCed6nfgu4lds
 w/RUOJUfuIQxHSUhYC5DQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sXED3eww/bk=:sIKcioDeV7G265+XgJ7uRI
 lqAzKrsfu3p6E+j5r1kQZRx7tDUdfq0G2DtpFl37srGvxRKvA7Kssp/XhbPvm1mBxXHXq1fXP
 KJ54UkKEK2HqQxDSpDrShmOOJ2CjtBjAKW21JMDTx3IaPPOBRQsuzvAbJ9NSuxqvvlNObRvgx
 NzqVBUTK4whYGKLktmZ2e4KAe5nWDzEjcRdo+K1RkO+O2HYc3J1hS7vowmsJYetX2iQVoU/+Z
 CuFi0ivjdKLSr/tFsgvymKh49NufdkE+W+8zLrxud+dkovAomVQ/cqQWdLAkT9C3MI86tWzLe
 hXaNw2lxQoGDixVBkFGqVl9+K8uMWP2PivVYBH7eXdTpUsrSS8WUMI1+Bqkfx+5FjJ227D737
 kInaf9/LILpba3S06Y37a2U/UzpeWJ4FmLT8BxyApnO+bSuo09qweR1LYVWYPGAoCwhtyvUu1
 8zYbhiKRKdmXxHMeB6fGAja6h6NidLCKTuH2j6e0W/t6f4bzcmgaF1ic2H4bnZXZRIEg0wvbI
 jMp0l+qR62vpy6oUHxCjCzbQStpyn4r+Hn3kVX5GD6pxxktn7fzUxoUo5VbWxhFdFsgHK4wde
 0S/7azMlxDDRYIjYjlBey/5NzAQyx+rNltHEWWWyEAm65rYpaKozEX+2gvCPi2HjWMoQI6MWf
 OnJCt4w5QHhOudLA8cRfAHOmGx631c6zeElGy1ka9SJxqr+2cN8poHBvgY5S+Ce/F1F1lEiBb
 gwn8p+xP0ZNvh/de0Z76HlNbZd46n4MEATY2S+K7Jcj2qztjz1RBm5z40K/6is4ysCqvztqah
 F7fhAcSXBdamw4ZUDzBThoO9xzZCy5SAyC77xYl4+TJMUJ2QrQv5Y5ckRNEI3FSS4jkDt9wsc
 +wwOO+ZMIm2CixY70Qe7o9W8MPW2/a+Jdrcfh0qvWjpB7K19IPyrHbak8uwM+vcGLtPqoA6sw
 gzHNtHdHPOXlleWdQewvKdWVynuIajhQI9l0blEEjIs2OEaq9CEzpxQ71ATdqq0SKIFMQX7Y3
 BZlQ0S5mJ6E/4RFSoTNMA+RV/xfoUJ/SeBA404cP9OA1szE8WPTOE3eESvgNsFw0Id0l7dQDH
 yj2KhuUFLi52OPeUQSOWzzzntk3hWDgkZBiN9LbpXSNFjuc7sdX8aMOiNarCkTY6iOf02Lfga
 RO9Dyv5vIvoLAwnCPHJ7RWS44qB9FjelrWngNfQC20oBIvAHWdhLdZZAjC24PWRe+78MbKsMk
 y1bxF+H3yXFnjSXXf
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2020-06-17 04:46:24 +0300, Jarkko Sakkinen wrote:
> On Fri, Jun 12, 2020 at 01:25:33PM +0200, Marcus Huewe wrote:
> > Do not check the return value of the commit_creds call in
> > join_session_keyring in order to make the code more concise.
> > Since commit_creds always returns 0, the if-statement is not needed
> > and the session keyring's serial can be directly assigned to the
> > "ret" variable.
> >
> > Signed-off-by: Marcus Huewe <suse-tux@gmx.de>
>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>
> David, can you pick this up to your tree (give that a generic
> keyring change)?
>
Just a gentle ping - any news on this?:)

(I'm perfectly fine if you don't want to take it... (since it is
just a minor cleanup and no bugfix))


Marcus
