Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB9F79F255
	for <lists+keyrings@lfdr.de>; Wed, 13 Sep 2023 21:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbjIMTqT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Sep 2023 15:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjIMTqR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Sep 2023 15:46:17 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92C719AE
        for <keyrings@vger.kernel.org>; Wed, 13 Sep 2023 12:46:12 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so144346a12.3
        for <keyrings@vger.kernel.org>; Wed, 13 Sep 2023 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694634371; x=1695239171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dacT9sVMQZR6IpEeTHkxsBNkLKLIIgVKMRtbWHncpOU=;
        b=Ieng8YJzV1dYpW7tW3qMJfsk+eT10ASnUX5nKTV0I7pL9eY/TGvYkWmJITjUdAsLRc
         B/6+q1P3pmBLahskCYP7qZRCLEwLuzws6umXcViQMzgzG7a+76JQFG6prFrtOLhzJ+gg
         3J8XuXylqKbT60EuvfdPyKk/fARpqw4HH46d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694634371; x=1695239171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dacT9sVMQZR6IpEeTHkxsBNkLKLIIgVKMRtbWHncpOU=;
        b=BEOPSqvd65dDUfNJOrv8+ZzGfOJmGAFtAk/eE60CZNJdgCW1TDe8Whqnj+rUWZzBFb
         pYnboSdab3dWF6M68C1uaII4CLVpvP5OLFeujWMUgD+SOXdxKWfRSpoyJlv6aYUTHKsI
         jmsnzFXEOblqI6WdIcM8hndA4fqYj7yZy7/B2lmHq9xpQ7YfWFQdxcSmVSztOqiluaN4
         C7GvmNBCsojOC1azzN6TGl23sJrP91tOyd8xW2Vvz3xkT/U6Mvdr3KTqBQXQzkbBe4/Q
         S5MerU9N8x3kOEcJYw2oU/toSMfdSKC6jfQa/ZO7HRL9fU6nwsKGfi8mXXECcoHK6GZf
         kGew==
X-Gm-Message-State: AOJu0Yx09cO2vbtlOmkWQsweSRQ4mzukyRnR6ig4K5MtLfWtHpvQ6KWh
        ZH5093X8cikMi18NYqdXhjAHPkteIPhSjbMrkOoVASze
X-Google-Smtp-Source: AGHT+IElTGv1yJpxssWWEnEsqzki9BVAT/7/KkODlTkt4VY79YTU7uL/Sp+dkL/mSPv4haN9h4d8Jg==
X-Received: by 2002:a17:906:5a59:b0:9ad:7f13:4db8 with SMTP id my25-20020a1709065a5900b009ad7f134db8mr2946192ejc.36.1694634371104;
        Wed, 13 Sep 2023 12:46:11 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906941800b0098921e1b064sm8821838ejx.181.2023.09.13.12.46.09
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 12:46:09 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so145367a12.2
        for <keyrings@vger.kernel.org>; Wed, 13 Sep 2023 12:46:09 -0700 (PDT)
X-Received: by 2002:a17:906:1099:b0:9a5:da6c:6551 with SMTP id
 u25-20020a170906109900b009a5da6c6551mr2636968eju.62.1694634369429; Wed, 13
 Sep 2023 12:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230912201102.1012306-1-jarkko@kernel.org> <CAHk-=wgLB9_z5TcvRKVsSk3BWPfkDeWN0pDMdEv=-hnrnTgX1Q@mail.gmail.com>
 <CVI1GKA044I2.2A5GRO80ABMNN@suppilovahvero>
In-Reply-To: <CVI1GKA044I2.2A5GRO80ABMNN@suppilovahvero>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 Sep 2023 12:45:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiS2rHdPe9qQ4Ahzy6t6hbG18ihsOjBYxn3Nr88yen52A@mail.gmail.com>
Message-ID: <CAHk-=wiS2rHdPe9qQ4Ahzy6t6hbG18ihsOjBYxn3Nr88yen52A@mail.gmail.com>
Subject: Re: [GIT PULL] tpmdd changes for v6.6-rc2
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        David Howells <dhowells@redhat.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Justin M . Forbes" <jforbes@fedoraproject.org>,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 13 Sept 2023 at 12:32, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> Ok, I'll make something more reasonable.

Well, I took the pull already, just saying "tpm fix".

I assume the only thing the typo actually causes is printk's with a
typo in it. Maybe some sysfs name will be wrong?

That's the kind of information I would have _liked_ to see in the
merge message, but I didn't then delve into just where the class names
might actually be used.

               Linus
