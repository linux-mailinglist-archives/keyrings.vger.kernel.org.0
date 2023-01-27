Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F46B67E2A3
	for <lists+keyrings@lfdr.de>; Fri, 27 Jan 2023 12:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjA0LHS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 27 Jan 2023 06:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjA0LHR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 27 Jan 2023 06:07:17 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778F0525E
        for <keyrings@vger.kernel.org>; Fri, 27 Jan 2023 03:07:16 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-501c3a414acso62268027b3.7
        for <keyrings@vger.kernel.org>; Fri, 27 Jan 2023 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxXF9KH8I0DINa+c/j6SSrxsO2OqIy6K56yAlZUfY/g=;
        b=QYY+g+US2HrPtVFHC2UFNZvsboTcfG9Ppq9dCwsw+qOpKgaPrrHn/3/MLno82SpCFs
         xexiZZtnYXiZTWQoFqdjbt/DDlhf33jNDp3+uNR01SUHLyk2OElXMxqRzd0IzZ5ELlK4
         dh/aC+bnC+IPmPdnDt9ZzxUVk6Q56LzV5cq/ga4k6vB53+XW8QKycJiuuaP+gWkwu1mN
         /6iz80KNz/XQb7g7xkdCi7rysjJcXJAn1aCBlbLeQV1kR1PnXLKI9QWrR33x1kzSlWT/
         cPbTFlmwBXdjkSrfdilpO6rdQTAY7axSIlnlJWSXZQLFhq8lhTV573EbOoB0sxgJHHXs
         xC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxXF9KH8I0DINa+c/j6SSrxsO2OqIy6K56yAlZUfY/g=;
        b=mf+azjo9tEg2IK+M5VV/7WhK0+loq64l96JNKA1tVzkm6H4uP1ccdptyjiuB0IxBAQ
         QZN5KeERbGpgPFMqzGfUSZv68/9Q88EuReRzZOprmPx0k19F0vihD7HL/tHOeR1xqt1X
         AOR+0oW9phta+N98+QAox6qSpMKORz9nahJ6juUWJleYZYLLdcdoWgGqO+tcLZ3B2QsZ
         AaidtLvDQXDEP5HvV0MwfEaYXdnrLHxawdEri8qZ2qhGOMX0F0TBuIjJXXLAW3Nu+p+G
         DB9f/kRxT01795mH99iTJowhytbX+wo9mAIRTQqou3hTyUu/A6/WLFnwJ6vM8sEosJEX
         NQ1Q==
X-Gm-Message-State: AFqh2krMLABlrFTvQDIFivAfLqVOrSbtC2MOm66R9sh+ZXBYSlNk9yv9
        T5VsbgrZsH09G4CBe7iK8TQlEFf5AcBAlIs0XVg=
X-Google-Smtp-Source: AMrXdXtFecyKojN4a4htyP6bp4j0YQYy5WEsuHO9cLeQ516mG/Z4QX7Qm2ISfKq6pDKSm2ycV9M8wIyVNfmMpsPbBkA=
X-Received: by 2002:a81:84c1:0:b0:502:684a:1178 with SMTP id
 u184-20020a8184c1000000b00502684a1178mr3762405ywf.294.1674817635612; Fri, 27
 Jan 2023 03:07:15 -0800 (PST)
MIME-Version: 1.0
References: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
 <2144380.1674658644@warthog.procyon.org.uk>
In-Reply-To: <2144380.1674658644@warthog.procyon.org.uk>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Fri, 27 Jan 2023 16:37:04 +0530
Message-ID: <CAGypqWx_GrpkS+2A84BG8Y9fSYo3a1cSy2NYWBqJud3uuvRPJA@mail.gmail.com>
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

Thanks David. Yes, Invalidating key by passing "true" for
key_invalidate parameter in dns_query works and resolves the major
issue of dns_query returning EKEYEXPIRED forever in some cases when
key cached in task_struct.


But I noticed other issue with above suggested changes. Where
dns_query is returning "ENOKEY",  when the cifs module does multiple
dns_query requests at the same time.

I performed the following steps to reproduce the issue:
(1) Mount two or more cifs/smb shares hosted on a same server with
nosharesock mount option.
(2) Kill multiple SMB connections using "ss -K dport 445" so that cifs
performs the dns_query operation as a part of reconnect.
(3) Observe the dns resolver logs, Only one dns_request got correct
resolutions and others fails with "ENOKEY".
(4) I didn=E2=80=99t observe this issue when cifs attempts one dns_query at=
 a
time. Simulated by killing one SMB connection at a time.
(5) So far I have observed that, this issue happens only at the point
when we simulate multiple disconnections at same time.

dns_resolver module logs:

[Fri Jan 27 09:59:40 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Fri Jan 27 09:59:40 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Fri Jan 27 09:59:40 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Fri Jan 27 09:59:40 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Fri Jan 27 09:59:40 2023] [cifsd ] =3D=3D>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.fi=
le.core.windows.net)
[Fri Jan 27 09:59:40 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
[Fri Jan 27 09:59:40 2023] [key.dn] =3D=3D> dns_resolver_preparse('
20.150.20.136',14)
[Fri Jan 27 09:59:40 2023] [key.dn] no options
[Fri Jan 27 09:59:40 2023] [key.dn] store result
[Fri Jan 27 09:59:40 2023] [key.dn] <=3D=3D dns_resolver_preparse() =3D 0
[Fri Jan 27 09:59:40 2023] [cifsd ] <=3D=3D dns_query() =3D 13
[Fri Jan 27 09:59:40 2023] [cifsd ] <=3D=3D dns_query() =3D -126 =3D=3D=3D=
=3D=3D=3D=3D> ENOKEY


[Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Fri Jan 27 09:59:49 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.fi=
le.core.windows.net)
[Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
[Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Fri Jan 27 09:59:49 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Fri Jan 27 09:59:49 2023] [cifsd ] =3D=3D>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.fi=
le.core.windows.net)
[Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
[Fri Jan 27 09:59:49 2023] [key.dn] =3D=3D> dns_resolver_preparse('
20.150.20.136',14)
[Fri Jan 27 09:59:49 2023] [key.dn] no options
[Fri Jan 27 09:59:49 2023] [key.dn] store result
[Fri Jan 27 09:59:49 2023] [key.dn] <=3D=3D dns_resolver_preparse() =3D 0
[Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_query() =3D 13
[Fri Jan 27 09:59:49 2023] [cifsd ] <=3D=3D dns_query() =3D -126


On Wed, Jan 25, 2023 at 8:27 PM David Howells dhowells@redhat.com wrote:
>
> Does the attached fix your problem?
>
> David
> ---
> diff --git a/fs/cifs/dns_resolve.c b/fs/cifs/dns_resolve.c
> index 8bf8978bc5d6..c77ac47fb08b 100644
> --- a/fs/cifs/dns_resolve.c
> +++ b/fs/cifs/dns_resolve.c
> @@ -66,7 +66,7 @@ dns_resolve_server_name_to_ip(const char *unc, struct s=
ockaddr *ip_addr, time64_
>
>         /* Perform the upcall */
>         rc =3D dns_query(current->nsproxy->net_ns, NULL, hostname, len,
> -                      NULL, &ip, expiry, false);
> +                      NULL, &ip, expiry, true);
>         if (rc < 0) {
>                 cifs_dbg(FYI, "%s: unable to resolve: %*.*s\n",
>                          __func__, len, len, hostname);
>
