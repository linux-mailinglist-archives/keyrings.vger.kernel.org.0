Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C4814D7D3
	for <lists+keyrings@lfdr.de>; Thu, 30 Jan 2020 09:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgA3Iiy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 Jan 2020 03:38:54 -0500
Received: from mga07.intel.com ([134.134.136.100]:54804 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgA3Iiy (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 Jan 2020 03:38:54 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jan 2020 00:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,381,1574150400"; 
   d="scan'208";a="232837401"
Received: from kvehmane-mobl.ger.corp.intel.com (HELO jsakkine-mobl1) ([10.237.50.119])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2020 00:38:50 -0800
Message-ID: <c227488f2b52e43fa28d3ff5581172bb739fd791.camel@linux.intel.com>
Subject: Re: [PATCH 1/1] proc_keys_next should increase position index
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Vasily Averin <vvs@virtuozzo.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Date:   Thu, 30 Jan 2020 10:38:49 +0200
In-Reply-To: <af9dcaa7-6e4f-281a-2bae-fb605cc55d2d@virtuozzo.com>
References: <af9dcaa7-6e4f-281a-2bae-fb605cc55d2d@virtuozzo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 2020-01-24 at 09:25 +0300, Vasily Averin wrote:
> if seq_file .next fuction does not change position index,
> read after some lseek can generate unexpected output.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=206283
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>

Similar comments as I gave here:

https://patchwork.kernel.org/patch/11346943/

/Jarkko

