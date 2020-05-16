Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA1E1D6433
	for <lists+keyrings@lfdr.de>; Sat, 16 May 2020 23:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgEPVSl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 16 May 2020 17:18:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:33290 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726592AbgEPVSk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 16 May 2020 17:18:40 -0400
IronPort-SDR: ZZuzS8IOBXEW+v1h5cTEDq1glsAs1qI7TZgrFxM1SszOZPiI9+RRkQYe6gPllyR2EljTeETAGu
 zfhwKtfrfxhw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2020 14:18:40 -0700
IronPort-SDR: 4HImsPeXTq8GVTqmQwHZliWu3mNe+7BFYnanUSVp9o34M/EvriE/pW7+Z4quvME4eFN/A9tkat
 wwDWchkPNZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,400,1583222400"; 
   d="scan'208";a="252700197"
Received: from mroth-mobl.ger.corp.intel.com ([10.249.39.103])
  by fmsmga007.fm.intel.com with ESMTP; 16 May 2020 14:18:37 -0700
Message-ID: <107345f21c1091dc7fb34054769332e08d256f70.camel@linux.intel.com>
Subject: Re: [PATCH 1/1] Documentation: security: core.rst: add missing
 argument
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Ben Boeckel <me@benboeckel.net>, keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 17 May 2020 00:18:36 +0300
In-Reply-To: <20200516003917.2035545-2-list.lkml.keyrings@me.benboeckel.net>
References: <20200516003917.2035545-1-list.lkml.keyrings@me.benboeckel.net>
         <20200516003917.2035545-2-list.lkml.keyrings@me.benboeckel.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 2020-05-15 at 20:39 -0400, Ben Boeckel wrote:
> From: Ben Boeckel <mathstuf@gmail.com>
> 
> This argument was just never documented in the first place.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko

