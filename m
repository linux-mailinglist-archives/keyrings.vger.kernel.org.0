Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565CC35D6D
	for <lists+keyrings@lfdr.de>; Wed,  5 Jun 2019 15:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfFENDP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 5 Jun 2019 09:03:15 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:34500 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfFENDO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 5 Jun 2019 09:03:14 -0400
Received: by mail-qk1-f182.google.com with SMTP id t64so5052942qkh.1
        for <keyrings@vger.kernel.org>; Wed, 05 Jun 2019 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition:user-agent;
        bh=gaSEYTf0HKmg5eout1nok/T595p9zInbog9jLY3x8J0=;
        b=R59aTj4HaVFxRtC+p/6IzsWiH6ZQGDpt/Dtt44FUqYrzgKyHmPoZLSCEE3vgSaqR+Q
         UomNpeZz5SPVGF6WipeTY2REefKVj9q2+0vfiE+KCYtALpCzEjDRU/pOeEYCMevUILQs
         Cm0PEdIw93yBLmzLJiJHfbQOzdcc8ZnHEa0hzi3AX53H92arqexhyNFVx3xFIpYbofwC
         PQ4V+sXeSwb4ilfCA/7W21VZKWhkRWGJdDI6rqUaaMNx5djjzb+VQZnLNkfCSM1cTpqD
         m3dMl4F6ro4hovc1I2OYSpbCDH4K9WpGfLhwywYSCsarXpeSoCRilnzAJvUdrcWDrOII
         PFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition:user-agent;
        bh=gaSEYTf0HKmg5eout1nok/T595p9zInbog9jLY3x8J0=;
        b=OB6a0wnAEevGF8VUyHKVm/zm8mU2nCyq0vqrYTKGjJ77QW63Y/2tpbnTvA/ja0Dh5E
         WFlcQ5V5KyNyqYp90EPifilONZwMVBhArhrybN1W+4Psbvu/rvfYaAyOYDYzH7zoKi6t
         B6zPqHRAgoP3EUnk3hKeNlJC+RS8BvlXaUGQvDVOZ36okAqc2qo2kVSyy4A+b7AkRmzF
         WuTndyhjh6uUTeJg2eH+qgTk418KLQlQqLL6nTcONKSbqjqUeJ4mGZPyLZ0Qhm04JKPB
         l3J/jRRKWec6yCvkjw0szgmfdHOvGMJQSdSoi30WT8DRoweQUjoYmevEKHHDkV1I3yPZ
         hJpg==
X-Gm-Message-State: APjAAAWRZ6NcZkfZ1SPC5SrY0EcM6Q/YuWIfrDV2RA/ha1LE8lSHS4Si
        QBLQZ0fDl32VBI2HmVvIqgGiLc6h
X-Google-Smtp-Source: APXvYqyZYT3YQYeb2pZCLk/XFmb+YIVI2o4a21UowlnTNebuSyb2IykKCkAPrbe7w2FY4kThdvA/MQ==
X-Received: by 2002:a05:620a:1404:: with SMTP id d4mr9724358qkj.228.1559739793544;
        Wed, 05 Jun 2019 06:03:13 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id k6sm661325qkd.21.2019.06.05.06.03.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 06:03:12 -0700 (PDT)
Date:   Wed, 5 Jun 2019 09:02:47 -0400
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: keyctl_capabilities and buflen
Message-ID: <20190605130247.GA21275@rotor.kitware.com>
Reply-To: mathstuf@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

I'm looking at the implementation of `keyctl_capabilities` in the `next`
branch and it's not clear if `buflen` is the size of the memory pointed
to by `buffer` in array size or in byte size by its documentation. It
seems to be the size in bytes by the code (the &3) could probably
warrant a comment to make it clearer that it is related to
sizeof(unsigned int) here). This seems very odd to me, or is it just a
common kernel pattern I haven't seen before?

Thanks,

--Ben
