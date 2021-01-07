Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7519F2EE7AC
	for <lists+keyrings@lfdr.de>; Thu,  7 Jan 2021 22:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbhAGVe4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 7 Jan 2021 16:34:56 -0500
Received: from mga03.intel.com ([134.134.136.65]:17733 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbhAGVe4 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 7 Jan 2021 16:34:56 -0500
IronPort-SDR: oDZvsI6gwnPC+980E3qUWAN4zTbkHnrgyoNix6XbwPMdu3NWaUALv/8wKPpsQ+3fwmKtqEraHu
 FwNSt7yUEVBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="177599031"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="177599031"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 13:34:15 -0800
IronPort-SDR: eBYslk9A5njqDyX2A2+4qKWCYfZoeVZkViI+saFx7QlGcXiOlISuj2/xBF3v6fJBP87aw6+QHh
 /FPNEhzEpyxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="567896943"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.53])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jan 2021 13:34:14 -0800
Date:   Thu, 7 Jan 2021 13:37:10 -0800
From:   Alison Schofield <alison.schofield@intel.com>
To:     keyrings@vger.kernel.org
Cc:     Dan Williams <dan.j.williams@intel.com>
Subject: Request_key from KMIP appliance
Message-ID: <20210107213710.GA11415@alison-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi,

I'm looking into using an external key server to store the encrypted blobs
of kernel encrypted keys. Today they are stored in the rootfs, but we'd
like to address the need to store the keys in an external KMIP appliance,
separate from the platform where deployed.

Any leads, thoughts, experience with the Linux Kernel Key Service
requesting keys from an external Key Server such as this?

Thanks,
Alison
