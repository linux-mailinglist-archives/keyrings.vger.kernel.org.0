Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFA81AD568
	for <lists+keyrings@lfdr.de>; Fri, 17 Apr 2020 06:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgDQE5P (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Apr 2020 00:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgDQE5O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Apr 2020 00:57:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDE9C061A0C
        for <keyrings@vger.kernel.org>; Thu, 16 Apr 2020 21:57:14 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 131so729397lfh.11
        for <keyrings@vger.kernel.org>; Thu, 16 Apr 2020 21:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAXLh21D1H+VdzVaEm6UUMdNn6pp4CFR+JZITSbC43A=;
        b=omvUtMObZ4ytZy4ga07liDJn7z889vwFl09t5zHlrYCBSU49S9IkMFuqiBa9d39etu
         KsKWpvl2Cki8Uu9FJKXae1I2yYCBUCOx3AyCTHGEeoS1ix4CgHBdno3vZaqUAXNA0R2B
         AGO/9LMYemZFLFg/pxQGFrL7TJz2koP+sVQBzb9UzeV3F+Etcqqu7tVjIFBPhPmW7d/Z
         N05JLYgt+palNlhbjz4Wf9+lQ78ol/d6WZ5eos9IdYe0iecp28/MsKfb0/lJAwUQZoTP
         HXyeky6W5Flv/7ss9Inw39okRWqUUCnUfmLr5iNWoZ3U6z31XtvM1XlmyLiQAC/OvFeo
         6n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAXLh21D1H+VdzVaEm6UUMdNn6pp4CFR+JZITSbC43A=;
        b=Nz/pFqFCjA880NtWJ4ThC2cnnF33A/EAfsS1ZqO0gVY/wE7IbkSmr5wib59lqp402H
         waUyvPFjLNA4TnOHmAWvLFjS1fndWsWPULiY5JIbVRMbzf6//jwoMkJ5jiR9bCJwnHnB
         Vfb1l2PDKwbuj2aYTDXE68HrRJRjEWLheNw9+jHij1iFHeT17gKQDTZzQhsBKjbhGqKc
         3brJSxmoWVzaY7myBg3HPnuG5rZnfn3wBu8RIqwC0cXYTWVC75QNz4wly38jHMTYm6xT
         6ZrseNHpjiGh9jGGUnqndQQVEDlM/VkJP+H/W85HXTGI2Aa4dJTQ6ktxy3b1LUtmvzW8
         QPkA==
X-Gm-Message-State: AGi0PuakEnQTLwFWViGKohPF3yQ8SJcH3OHlssAXuAmJhhY4PpbboRcY
        hqXewrQGYMH+xagQWxtQDksWTpO8r51+aw30fSrS920m
X-Google-Smtp-Source: APiQypLUdzsG2tylnYP/76UWnLr0a8aCftlJOk0jhGyINMlUAKjyl7H4IKqA4OZZlwWqjW74t1URhYwOm29xZbRW2S4=
X-Received: by 2002:ac2:5c07:: with SMTP id r7mr840725lfp.160.1587099432900;
 Thu, 16 Apr 2020 21:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <1585636165-22481-1-git-send-email-sumit.garg@linaro.org> <20200416174617.GI199110@linux.intel.com>
In-Reply-To: <20200416174617.GI199110@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 17 Apr 2020 10:27:01 +0530
Message-ID: <CAFA6WYNJuxGToM1R02RsrZ_xK6Rfi1SndY1oVYaAbizMpeGPbg@mail.gmail.com>
Subject: Re: [PATCH] doc: trusted-encrypted: updates with TEE as a new trust source
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Janne Karhunen <janne.karhunen@gmail.com>, kgoldman@us.ibm.com,
        "Safford, David (GE Global Research, US)" <david.safford@ge.com>,
        monty.wiseman@ge.com, Daniel Thompson <daniel.thompson@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 16 Apr 2020 at 23:16, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Tue, Mar 31, 2020 at 11:59:25AM +0530, Sumit Garg wrote:
> > Update documentation for Trusted and Encrypted Keys with TEE as a new
> > trust source. Following is brief description of updates:
> >
> > - Add a section to demostrate a list of supported devices along with
> >   their security properties/guarantees.
> > - Add a key generation section.
> > - Updates for usage section including differences specific to a trust
> >   source.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Overally this works for me. Can you bundle this with the code
> changes. Maybe some details needs to be fine tuned but easier
> to look into them in the context of rest of the patches.
>

Sure, I will send next version of complete patch-set.

-Sumit

> /Jarkko
