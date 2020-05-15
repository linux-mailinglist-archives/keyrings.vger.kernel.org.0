Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802601D5986
	for <lists+keyrings@lfdr.de>; Fri, 15 May 2020 20:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgEOSzy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 14:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgEOSzx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 14:55:53 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819FDC061A0C;
        Fri, 15 May 2020 11:55:53 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j145so3146940oib.5;
        Fri, 15 May 2020 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VvMtgHIRLykxmhWLdZJQYZ0krOC9vXjMfTK6g/AZbUA=;
        b=ErHcxT+mAoqp7ksTgGa9KWZE69wefN59b50K++XYxGuilOr/0/UNUbODmS9b7vehP2
         GcDlCVyo34Jqu4ZS6FVuMpFADa7ICKUupguIPKLT1kNPfOIxBQ3ZlqH7GQCWd/DjISyi
         IlZKBpHC2yesBPkDwvGGUPwUQI9eKzkL/oYB8Bskz9ohCXh+LHQe+/4dlNCdrShSoJHn
         D1qmYBvDpYrzOtki0/3ygKjl7y7uTwPhNAwdF7LKc7uqTd6IjPT3SHMEXKzoqpTqWKPb
         D+uh1ZiCWOpJsDmfIJ9UfYSr9P+3tR/UdrEZ3KqJiK/o4t7THq8fLqsFSWWotqaFzeMS
         wK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VvMtgHIRLykxmhWLdZJQYZ0krOC9vXjMfTK6g/AZbUA=;
        b=rRRkVWflh3GbOTIWaTHmAw45gVWJaTfxsxeQGLNt+I7WHyH86T+jx1OOpEor3P05Uz
         04aoFxVn1HPN+DCYhYOl85EnmQF1s/uULwjXvT5bHlKu0e2+95ZBc/yHQPr9j04mxw+Q
         QI18nI0Zoby2pu1rMGfTTwYkbC6oMHrXEq/OouL/VaMP6Oxv1Q8EUR0dl0Atyvu2k5UA
         W33A6oLv8wxLlqXr7wKxcpd/WiHMtmXM1t3Iczdg/BGOPpFU3PNiWW3J8zHSHwefsvIj
         ++j8YyK9KeRICN0nAOSJqzGn9jycn9nhSzkuVQiEPR4SFVwp/itzeek7MbQLmVUGobdf
         H5yQ==
X-Gm-Message-State: AOAM533dXdc+HE69K6YLUPc0NpDSw7IAOr5eryZP7IMU73u0UYT8Nwkd
        eYoijmLQCdKaOQwiXtqjC3VFtcwKhiG5SQzu5QRwEO37
X-Google-Smtp-Source: ABdhPJzY4volsN0uHSJFmoFggMhaZdolh0W7pFgZ1qIQk13JeIs49jjw8dYtyQry1Dj4ljshCyilGrGGvb+jkPIBADo=
X-Received: by 2002:aca:210a:: with SMTP id 10mr3055246oiz.92.1589568952881;
 Fri, 15 May 2020 11:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
 <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com>
 <3999877.1589475539@warthog.procyon.org.uk> <CAEjxPJ5wW2qHYDsqKr5rjnRJ++4f2LXobCQkKZvWCSb_j0WN6w@mail.gmail.com>
 <196730.1589561109@warthog.procyon.org.uk>
In-Reply-To: <196730.1589561109@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 15 May 2020 14:55:42 -0400
Message-ID: <CAEjxPJ6JGZxF_G63Y7M-CQpmt5Sqp2uFF4oEKS6NpNLZxXhXcA@mail.gmail.com>
Subject: Re: [PATCH] keys: Move permissions checking decisions into the
 checking code
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        keyrings@vger.kernel.org, SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, May 15, 2020 at 12:45 PM David Howells <dhowells@redhat.com> wrote:
> I can go back to the enum patch for the moment if you and Casey can put up
> with that for the moment?

Yes, let's do that.
