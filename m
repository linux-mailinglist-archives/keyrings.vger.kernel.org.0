Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7272E2F9
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 19:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfE2ROF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 13:14:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41176 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbfE2RN7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 May 2019 13:13:59 -0400
Received: by mail-pf1-f195.google.com with SMTP id q17so2035339pfq.8
        for <keyrings@vger.kernel.org>; Wed, 29 May 2019 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+4Eck+CFhCFREBdh4WIXuLZ5kettic1ax4lTFdn88wA=;
        b=RJWFuUbmbLU9gIBz85ery+5ZrcHRD50gf+QgLi0fsnsFBkSZVVTge0BZRDH214wxlM
         xR1FFryYZcnL06XkYs3karxylMDI4ZPBxg4hGX0q+kFpGJhWNTcoqbhTjFqwHfWg+0Sh
         iXq39rEwL79hjOaWNzhZg2UvhqlbHp9V5TGHA46JMpBQT/gKJOQtlUPu6V8LOlAfSTsf
         TQq70k4ixv5h06DmUpLIrTdS2Xnr//ws3EImfTsBmxGxj7guv7T9fFPcIrWPGl03Byh+
         LO4lVCRSICVNoPsP+tTwipnXTg3fYfDIrhTt5EpOw7O+6K9Vafqci5ZdOdTBtWGgCc4t
         43Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+4Eck+CFhCFREBdh4WIXuLZ5kettic1ax4lTFdn88wA=;
        b=oOVfhDmmT8ftFUe5Mf/WGTLX/viclFD76FiqbQo5N05VOhm1zcnHn7m4R46C+AOAHB
         Noy/xgGEvLYaPcybQxiJ10A0eHMTWI61JtLMF2xDHWhUrY0GiE+4ODu9eBSn3wUDLcY/
         a8HyZaM2qwPBjFm3jolGRQRS0/lECbV0V7MY4j0a2XbltwjenUMxH2Dz6S10SYtjnsSV
         Hm732IBnP0/GurUEbXN6zjV5bPoIsTBlXnUDZCKh9MlUggqwkz+4Ja8DLHobJprHZhfP
         90yKLo4xHan4tMuZ4gJzkTadJ3EJSLY2fs75d1JPMlnWNCFgo//Q5kefYivfJlcVsiK/
         1p5w==
X-Gm-Message-State: APjAAAXEsS0cHp9O912t3kc6WgIMPqsfu5gMzN1prCfWC92bkUXqerMo
        ItS6xZZNsdCu7UTadnw8xqZfbg==
X-Google-Smtp-Source: APXvYqyqmVMGLdTKYRRZzhmdhFCtL1BSUXhR/WZs8Ia9RHc7j0jqYo6Fp8wxiPWFhDb0CF4Dl70TNw==
X-Received: by 2002:a62:ab10:: with SMTP id p16mr117966777pff.222.1559150037283;
        Wed, 29 May 2019 10:13:57 -0700 (PDT)
Received: from ?IPv6:2600:100f:b10c:ace6:b862:4204:5f4a:fe22? ([2600:100f:b10c:ace6:b862:4204:5f4a:fe22])
        by smtp.gmail.com with ESMTPSA id y10sm204418pfm.68.2019.05.29.10.13.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 10:13:56 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 3/7] vfs: Add a mount-notification facility
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <312a138c-e5b2-4bfb-b50b-40c82c55773f@schaufler-ca.com>
Date:   Wed, 29 May 2019 10:13:54 -0700
Cc:     David Howells <dhowells@redhat.com>, Jann Horn <jannh@google.com>,
        Al Viro <viro@zeniv.linux.org.uk>, raven@themaw.net,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module <linux-security-module@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4552118F-BE9B-4905-BF0F-A53DC13D5A82@amacapital.net>
References: <CAG48ez2rRh2_Kq_EGJs5k-ZBNffGs_Q=vkQdinorBgo58tbGpg@mail.gmail.com> <155905930702.7587.7100265859075976147.stgit@warthog.procyon.org.uk> <155905933492.7587.6968545866041839538.stgit@warthog.procyon.org.uk> <14347.1559127657@warthog.procyon.org.uk> <312a138c-e5b2-4bfb-b50b-40c82c55773f@schaufler-ca.com>
To:     Casey Schaufler <casey@schaufler-ca.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



> On May 29, 2019, at 8:53 AM, Casey Schaufler <casey@schaufler-ca.com> wrot=
e:
>=20
>> On 5/29/2019 4:00 AM, David Howells wrote:
>> Jann Horn <jannh@google.com> wrote:
>>=20
>>>> +void post_mount_notification(struct mount *changed,
>>>> +                            struct mount_notification *notify)
>>>> +{
>>>> +       const struct cred *cred =3D current_cred();
>>> This current_cred() looks bogus to me. Can't mount topology changes
>>> come from all sorts of places? For example, umount_mnt() from
>>> umount_tree() from dissolve_on_fput() from __fput(), which could
>>> happen pretty much anywhere depending on where the last reference gets
>>> dropped?
>> IIRC, that's what Casey argued is the right thing to do from a security P=
oV.
>> Casey?
>=20
> You need to identify the credential of the subject that triggered
> the event. If it isn't current_cred(), the cred needs to be passed
> in to post_mount_notification(), or derived by some other means.

Taking a step back, why do we care who triggered the event?  It seems to me t=
hat we should care whether the event happened and whether the *receiver* is p=
ermitted to know that.

(And receiver means whoever subscribed, presumably, not whoever called read(=
) or mmap().)

