Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B97867E858
	for <lists+keyrings@lfdr.de>; Fri, 27 Jan 2023 15:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbjA0OeW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 27 Jan 2023 09:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbjA0OeU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 27 Jan 2023 09:34:20 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACD020D2A
        for <keyrings@vger.kernel.org>; Fri, 27 Jan 2023 06:34:18 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id t16so6213630ybk.2
        for <keyrings@vger.kernel.org>; Fri, 27 Jan 2023 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nv11ETL0edZ1nsrUa7mg06RyNFqtvaKbsV/9i549fnc=;
        b=iUfcZmfWPlLFvb2oXM2cpxZ81BGh6F9wm7EE4vaiQX8xYcSCh9+Q/57QS0ctvhV1Ce
         MkAtug3CjtJ1jMWld/PPqc7asKNHrNB6My7Lt74ueGo0PIXbU170VaH9D6eIhpA5J9zX
         D11ln0jcR9wW8XbbsHys3XqC+/eb+F5pRmCLw/eK8x21ikXIDtm1E0EZ9p9Ximj4q0xt
         PMtFQPmA+YTl9f+nrOSv5Jg6GfbLvBgmBTnnpVfw5Lu0S6PSl6Arx3pb35PZ5+ampf0s
         VikNHvxB0aWBih2Fj+jij/ciomuAuAwpvbS76TuyfIpgawCjNf4jiIzLM7tsXhL24nmi
         i3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nv11ETL0edZ1nsrUa7mg06RyNFqtvaKbsV/9i549fnc=;
        b=G6wSpd8lL7d3aL9q0g2m+9zQWS2T1ctZQ2W3so7dFTgphFOThWuPXFOZKT47oL6IXe
         AjnW+fGJwDKYMEDZkaqq41WKhHKnWIN9fznuVTSGW3rP0go5qq01C5poVQWjxi7/JoHU
         jRKgVhT/bmcmaJUuUvSTj5mdDvfi0Dyk7tfnxh7FpT4Y58QvJNC3WVoIksvMiDcgxnU8
         X1jE6DJ+DaBjTcXCz+ulzAuzVK/zi2jd4TQSLlbUIz4DYMDyoS7Dxf/WLPjdD8VTe+Qm
         e7TkKzSN88WP9CxfTk+5NS2Q25oD17Rton8k1gYtXNyb8RI6aczfzagQfopH82LMWrYt
         mieg==
X-Gm-Message-State: AO0yUKUHKuhSLXq5PJxD0jZuhGRz6DEYl27S9aJDvTdgm5BSTq/49Bcq
        23SgTWDN7srtOzQi/7UHrc1Jm7nce0iw1Ad59yE=
X-Google-Smtp-Source: AK7set9hN0cMS9DluBlj5ZGL3QRLUxn2ZmLCZyo9WSSTxzxl0n7OCbW06/Yl4n4v7i12R7127ycojNZBrjGahhRz3ss=
X-Received: by 2002:a25:40d2:0:b0:80b:e8b4:7fc with SMTP id
 n201-20020a2540d2000000b0080be8b407fcmr808822yba.358.1674830057903; Fri, 27
 Jan 2023 06:34:17 -0800 (PST)
MIME-Version: 1.0
References: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
 <2144380.1674658644@warthog.procyon.org.uk> <CAGypqWx_GrpkS+2A84BG8Y9fSYo3a1cSy2NYWBqJud3uuvRPJA@mail.gmail.com>
In-Reply-To: <CAGypqWx_GrpkS+2A84BG8Y9fSYo3a1cSy2NYWBqJud3uuvRPJA@mail.gmail.com>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Fri, 27 Jan 2023 20:04:06 +0530
Message-ID: <CAGypqWwYj9tTF7Pt4bwD9obrOhtk4DK8_BcA24wNSaqx3GYOfA@mail.gmail.com>
Subject: Re: dns_query from cifs returning EKEYEXPIRED during reconnect operations
To:     David Howells <dhowells@redhat.com>
Cc:     jarkko@kernel.org, keyrings@vger.kernel.org,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

How about having key_validate check in check_cached_key itself.?

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 2da4404276f0..9c20bade6e8e 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -26,8 +26,7 @@ static struct key *check_cached_key(struct
keyring_search_context *ctx)

        if (key &&
            ctx->match_data.cmp(key, &ctx->match_data) &&
-           !(key->flags & ((1 << KEY_FLAG_INVALIDATED) |
-                           (1 << KEY_FLAG_REVOKED))))
+           !(key_validate(key)))
                return key_get(key);
 #endif
        return NULL;

On Fri, Jan 27, 2023 at 4:37 PM Bharath SM <bharathsm.hsk@gmail.com> wrote:
>
> Thanks David. Yes, Invalidating key by passing "true" for
> key_invalidate parameter in dns_query works and resolves the major
> issue of dns_query returning EKEYEXPIRED forever in some cases when
> key cached in task_struct.
>
>
> But I noticed other issue with above suggested changes. Where
> dns_query is returning "ENOKEY",  when the cifs module does multiple
> dns_query requests at the same time.
>
> I performed the following steps to reproduce the issue:
> (1) Mount two or more cifs/smb shares hosted on a same server with
> nosharesock mount option.
> (2) Kill multiple SMB connections using "ss -K dport 445" so that cifs
> performs the dns_query operation as a part of reconnect.
> (3) Observe the dns resolver logs, Only one dns_request got correct
> resolutions and others fails with "ENOKEY".
> (4) I didn=E2=80=99t observe this issue when cifs attempts one dns_query =
at a
> time. Simulated by killing one SMB connection at a time.
> (5) So far I have observed that, this issue happens only at the point
> when we simulate multiple disconnections at same time.
>
> dns_resolver module logs:
>
> [Fri Jan 27 09:59:40 2023] [cifsd ] =3D=3D>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Fri Jan 27 09:59:40 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Fri Jan 27 09:59:40 2023] [cifsd ] =3D=3D>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Fri Jan 27 09:59:40 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Fri Jan 27 09:59:40 2023] [cifsd ] =3D=3D>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.=
file.core.windows.net)
> [Fri Jan 27 09:59:40 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
> [Fri Jan 27 09:59:40 2023] [key.dn] =3D=3D> dns_resolver_preparse('
> 20.150.20.136',14)
> [Fri Jan 27 09:59:40 2023] [key.dn] no options
> [Fri Jan 27 09:59:40 2023] [key.dn] store result
> [Fri Jan 27 09:59:40 2023] [key.dn] <=3D=3D dns_resolver_preparse() =3D 0
> [Fri Jan 27 09:59:40 2023] [cifsd ] <=3D=3D dns_query() =3D 13
> [Fri Jan 27 09:59:40 2023] [cifsd ] <=3D=3D dns_query() =3D -126 =3D=3D=
=3D=3D=3D=3D=3D> ENOKEY
>
>
> [Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Fri Jan 27 09:59:49 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.=
file.core.windows.net)
> [Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
> [Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Fri Jan 27 09:59:49 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.=
file.core.windows.net)
> [Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
> [Fri Jan 27 09:59:49 2023] [key.dn] =3D=3D> dns_resolver_preparse('
> 20.150.20.136',14)
> [Fri Jan 27 09:59:49 2023] [key.dn] no options
> [Fri Jan 27 09:59:49 2023] [key.dn] store result
> [Fri Jan 27 09:59:49 2023] [key.dn] <=3D=3D dns_resolver_preparse() =3D 0
> [Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_query() =3D 13
> [Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_query() =3D -126
>
>
> On Wed, Jan 25, 2023 at 8:27 PM David Howells dhowells@redhat.com wrote:
> >
> > Does the attached fix your problem?
> >
> > David
> > ---
> > diff --git a/fs/cifs/dns_resolve.c b/fs/cifs/dns_resolve.c
> > index 8bf8978bc5d6..c77ac47fb08b 100644
> > --- a/fs/cifs/dns_resolve.c
> > +++ b/fs/cifs/dns_resolve.c
> > @@ -66,7 +66,7 @@ dns_resolve_server_name_to_ip(const char *unc, struct=
 sockaddr *ip_addr, time64_
> >
> >         /* Perform the upcall */
> >         rc =3D dns_query(current->nsproxy->net_ns, NULL, hostname, len,
> > -                      NULL, &ip, expiry, false);
> > +                      NULL, &ip, expiry, true);
> >         if (rc < 0) {
> >                 cifs_dbg(FYI, "%s: unable to resolve: %*.*s\n",
> >                          __func__, len, len, hostname);
> >
