Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C637A731AC4
	for <lists+keyrings@lfdr.de>; Thu, 15 Jun 2023 16:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344659AbjFOOD7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 15 Jun 2023 10:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344676AbjFOOD6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 15 Jun 2023 10:03:58 -0400
X-Greylist: delayed 1062 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Jun 2023 07:03:57 PDT
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967EA1FC3
        for <keyrings@vger.kernel.org>; Thu, 15 Jun 2023 07:03:57 -0700 (PDT)
Received: from cpc147142-seac28-2-0-cust145.7-2.cable.virginm.net ([81.104.152.146] helo=[192.168.0.48])
        by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
        id 1q9nIi-008pUA-Bp
        for <keyrings@vger.kernel.org> ; Thu, 15 Jun 2023 14:46:13 +0100
Message-ID: <8b9eed97-b41c-34e3-8183-056f8e5643b5@codethink.co.uk>
Date:   Thu, 15 Jun 2023 14:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     keyrings@vger.kernel.org
From:   Tanvir Roshid <tanvir.roshid@codethink.co.uk>
Subject: keyutils - reproducibility
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_40,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

I hope you are well.

I made a post here: 
https://github.com/auristor/keyutils/issues/1#issue-1750897652 and was 
advised to directly contact.

What is the best way to ensure that the buildid is reproducible? The 
current patch is not a proper solution.

Kind regards,
Tanvir

