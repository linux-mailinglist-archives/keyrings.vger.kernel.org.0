Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6DF43EC0
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389684AbfFMPwn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:52:43 -0400
Received: from hmm.wantstofly.org ([138.201.34.84]:45226 "EHLO
        mail.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732816AbfFMPwm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 11:52:42 -0400
X-Greylist: delayed 444 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jun 2019 11:52:42 EDT
Received: by mail.wantstofly.org (Postfix, from userid 1000)
        id F15C6804FA; Thu, 13 Jun 2019 18:45:16 +0300 (EEST)
Date:   Thu, 13 Jun 2019 18:45:16 +0300
From:   Lennert Buytenhek <buytenh@wantstofly.org>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH 0/3] Several keyctl pkey_* fixes
Message-ID: <20190613154516.GC9017@wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

Here are some patches to make keyctl's pkey_* operations work for me --
without at least patches 1 and 2, they don't seem to work at all and I
don't see how they ever could have worked.  Patch 3 isn't required but
makes things a little more consistent.

Thanks in advance!


Cheers,
Lennert
