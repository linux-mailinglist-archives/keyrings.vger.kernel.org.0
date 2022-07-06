Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E3A569057
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 19:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbiGFRLV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Jul 2022 13:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiGFRLU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Jul 2022 13:11:20 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF941EC65;
        Wed,  6 Jul 2022 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657127478; x=1688663478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZ21WeUn2BvY+TriUS2rQPak4SchM30SywlYdffG4P0=;
  b=CrBZjo7r+HdVGMmTEsl84VhKztqZRnMDweEPz6kfKB+Yb4wwhNnH3umT
   y0ohvnN49UNUU9fimq2kQOFMQ6sywTE8qY+ods2oX1g1IFpvE0trKx8N3
   HneJ8Mm1MQ/JFs/czVZhtWVPSD8w8ToEk/MHjyjjPJ8H6Vj8Ghu4y7Vy1
   AG/CT7raJbJCkEpxN5Miyqdsb86RKyHvrscJh4Kr3OEZmTjK3zYDwu2nw
   26TbfrKO5fzjbj1ROwm+XaopqLMXBqk/YkDql7r7yvdZ30dANtny9zcmy
   jVSM8WU/Dq20u9//YIWXLVdpyuPcrmtgyUMpFZN5hXbyezQzV3dTERu4R
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="281364065"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="281364065"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 10:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="625981050"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2022 10:11:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o98YU-000KpD-0G;
        Wed, 06 Jul 2022 17:11:14 +0000
Date:   Thu, 7 Jul 2022 01:10:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Cc:     kbuild-all@lists.01.org, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org, andrzej.jakowski@intel.com,
        jonathan.derrick@linux.dev, drmiller.lnx@gmail.com,
        linux-block@vger.kernel.org, greg@gilhooley.com
Subject: Re: [PATCH 4/4] arch_vars: create arch specific permanent store
Message-ID: <202207070041.gf2Xgary-lkp@intel.com>
References: <20220706023935.875994-5-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706023935.875994-5-gjoyce@linux.vnet.ibm.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v5.19-rc5 next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gjoyce-linux-vnet-ibm-com/sed-opal-keyrings-discovery-revert-and-key-store/20220706-104204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: sparc64-randconfig-r002-20220703 (https://download.01.org/0day-ci/archive/20220707/202207070041.gf2Xgary-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b984dda112cdbda6b41045bf63f790a3c2903c7a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review gjoyce-linux-vnet-ibm-com/sed-opal-keyrings-discovery-revert-and-key-store/20220706-104204
        git checkout b984dda112cdbda6b41045bf63f790a3c2903c7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   block/sed-opal.c: In function 'update_sed_opal_key':
>> block/sed-opal.c:286:15: error: implicit declaration of function 'key_alloc'; did you mean 'bdev_alloc'? [-Werror=implicit-function-declaration]
     286 |         key = key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
         |               ^~~~~~~~~
         |               bdev_alloc
>> block/sed-opal.c:286:26: error: 'key_type_user' undeclared (first use in this function)
     286 |         key = key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
         |                          ^~~~~~~~~~~~~
   block/sed-opal.c:286:26: note: each undeclared identifier is reported only once for each function it appears in
>> block/sed-opal.c:288:33: error: 'KEY_USR_VIEW' undeclared (first use in this function)
     288 |                                 KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
         |                                 ^~~~~~~~~~~~
>> block/sed-opal.c:288:48: error: 'KEY_USR_SEARCH' undeclared (first use in this function)
     288 |                                 KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
         |                                                ^~~~~~~~~~~~~~
>> block/sed-opal.c:288:65: error: 'KEY_USR_WRITE' undeclared (first use in this function)
     288 |                                 KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
         |                                                                 ^~~~~~~~~~~~~
>> block/sed-opal.c:294:15: error: implicit declaration of function 'key_instantiate_and_link'; did you mean 'd_instantiate_anon'? [-Werror=implicit-function-declaration]
     294 |         ret = key_instantiate_and_link(key, key_data, keylen,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               d_instantiate_anon
   block/sed-opal.c: In function 'read_sed_opal_key':
>> block/sed-opal.c:307:9: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
     307 |         key_ref_t kref;
         |         ^~~~~~~~~
         |         key_ref_put
>> block/sed-opal.c:313:16: error: implicit declaration of function 'keyring_search' [-Werror=implicit-function-declaration]
     313 |         kref = keyring_search(make_key_ref(sed_opal_keyring, true),
         |                ^~~~~~~~~~~~~~
   block/sed-opal.c:314:18: error: 'key_type_user' undeclared (first use in this function)
     314 |                 &key_type_user,
         |                  ^~~~~~~~~~~~~
>> block/sed-opal.c:318:20: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
     318 |         if (IS_ERR(kref)) {
         |                    ^~~~
         |                    |
         |                    int
   In file included from include/linux/container_of.h:6,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from block/sed-opal.c:12:
   include/linux/err.h:34:60: note: expected 'const void *' but argument is of type 'int'
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
>> block/sed-opal.c:319:31: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
     319 |                 ret = PTR_ERR(kref);
         |                               ^~~~
         |                               |
         |                               int
   In file included from include/linux/container_of.h:6,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from block/sed-opal.c:12:
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
>> block/sed-opal.c:322:31: error: invalid use of undefined type 'struct key'
     322 |                 down_read(&key->sem);
         |                               ^~
   block/sed-opal.c:325:41: error: invalid use of undefined type 'struct key'
     325 |                         if (buflen > key->datalen)
         |                                         ^~
   block/sed-opal.c:326:45: error: invalid use of undefined type 'struct key'
     326 |                                 buflen = key->datalen;
         |                                             ^~
   block/sed-opal.c:328:34: error: invalid use of undefined type 'struct key'
     328 |                         ret = key->type->read(key, (char *)buffer, buflen);
         |                                  ^~
   block/sed-opal.c:330:29: error: invalid use of undefined type 'struct key'
     330 |                 up_read(&key->sem);
         |                             ^~
   block/sed-opal.c: In function 'sed_opal_init':
>> block/sed-opal.c:2938:14: error: implicit declaration of function 'keyring_alloc'; did you mean 'warn_alloc'? [-Werror=implicit-function-declaration]
    2938 |         kr = keyring_alloc(".sed_opal",
         |              ^~~~~~~~~~~~~
         |              warn_alloc
>> block/sed-opal.c:2940:18: error: 'KEY_POS_ALL' undeclared (first use in this function)
    2940 |                 (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
         |                  ^~~~~~~~~~~
>> block/sed-opal.c:2940:33: error: 'KEY_POS_SETATTR' undeclared (first use in this function)
    2940 |                 (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
         |                                 ^~~~~~~~~~~~~~~
   block/sed-opal.c:2940:52: error: 'KEY_USR_VIEW' undeclared (first use in this function)
    2940 |                 (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
         |                                                    ^~~~~~~~~~~~
>> block/sed-opal.c:2941:17: error: 'KEY_USR_READ' undeclared (first use in this function)
    2941 |                 KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
         |                 ^~~~~~~~~~~~
   block/sed-opal.c:2941:32: error: 'KEY_USR_SEARCH' undeclared (first use in this function)
    2941 |                 KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
         |                                ^~~~~~~~~~~~~~
   block/sed-opal.c:2941:49: error: 'KEY_USR_WRITE' undeclared (first use in this function)
    2941 |                 KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
         |                                                 ^~~~~~~~~~~~~
>> block/sed-opal.c:2942:17: error: 'KEY_ALLOC_NOT_IN_QUOTA' undeclared (first use in this function)
    2942 |                 KEY_ALLOC_NOT_IN_QUOTA,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +286 block/sed-opal.c

455a7b238cd6bc Scott Bauer 2017-02-03  274  
8a2b115580e8f7 Greg Joyce  2022-07-05  275  /*
8a2b115580e8f7 Greg Joyce  2022-07-05  276   * Allocate/update a SED Opal key and add it to the SED Opal keyring.
8a2b115580e8f7 Greg Joyce  2022-07-05  277   */
8a2b115580e8f7 Greg Joyce  2022-07-05  278  static int update_sed_opal_key(const char *desc, u_char *key_data, int keylen)
8a2b115580e8f7 Greg Joyce  2022-07-05  279  {
8a2b115580e8f7 Greg Joyce  2022-07-05  280  	int ret;
8a2b115580e8f7 Greg Joyce  2022-07-05  281  	struct key *key;
8a2b115580e8f7 Greg Joyce  2022-07-05  282  
8a2b115580e8f7 Greg Joyce  2022-07-05  283  	if (!sed_opal_keyring)
8a2b115580e8f7 Greg Joyce  2022-07-05  284  		return -ENOKEY;
8a2b115580e8f7 Greg Joyce  2022-07-05  285  
8a2b115580e8f7 Greg Joyce  2022-07-05 @286  	key = key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
8a2b115580e8f7 Greg Joyce  2022-07-05  287  				current_cred(),
8a2b115580e8f7 Greg Joyce  2022-07-05 @288  				KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
8a2b115580e8f7 Greg Joyce  2022-07-05  289  				0,
8a2b115580e8f7 Greg Joyce  2022-07-05  290  				NULL);
8a2b115580e8f7 Greg Joyce  2022-07-05  291  	if (IS_ERR(key))
8a2b115580e8f7 Greg Joyce  2022-07-05  292  		return PTR_ERR(key);
8a2b115580e8f7 Greg Joyce  2022-07-05  293  
8a2b115580e8f7 Greg Joyce  2022-07-05 @294  	ret = key_instantiate_and_link(key, key_data, keylen,
8a2b115580e8f7 Greg Joyce  2022-07-05  295  			sed_opal_keyring, NULL);
8a2b115580e8f7 Greg Joyce  2022-07-05  296  	key_put(key);
8a2b115580e8f7 Greg Joyce  2022-07-05  297  
8a2b115580e8f7 Greg Joyce  2022-07-05  298  	return ret;
8a2b115580e8f7 Greg Joyce  2022-07-05  299  }
8a2b115580e8f7 Greg Joyce  2022-07-05  300  
8a2b115580e8f7 Greg Joyce  2022-07-05  301  /*
8a2b115580e8f7 Greg Joyce  2022-07-05  302   * Read a SED Opal key from the SED Opal keyring.
8a2b115580e8f7 Greg Joyce  2022-07-05  303   */
8a2b115580e8f7 Greg Joyce  2022-07-05  304  static int read_sed_opal_key(const char *key_name, u_char *buffer, int buflen)
8a2b115580e8f7 Greg Joyce  2022-07-05  305  {
8a2b115580e8f7 Greg Joyce  2022-07-05  306  	int ret;
8a2b115580e8f7 Greg Joyce  2022-07-05 @307  	key_ref_t kref;
8a2b115580e8f7 Greg Joyce  2022-07-05  308  	struct key *key;
8a2b115580e8f7 Greg Joyce  2022-07-05  309  
8a2b115580e8f7 Greg Joyce  2022-07-05  310  	if (!sed_opal_keyring)
8a2b115580e8f7 Greg Joyce  2022-07-05  311  		return -ENOKEY;
8a2b115580e8f7 Greg Joyce  2022-07-05  312  
8a2b115580e8f7 Greg Joyce  2022-07-05 @313  	kref = keyring_search(make_key_ref(sed_opal_keyring, true),
8a2b115580e8f7 Greg Joyce  2022-07-05  314  		&key_type_user,
8a2b115580e8f7 Greg Joyce  2022-07-05  315  		key_name,
8a2b115580e8f7 Greg Joyce  2022-07-05  316  		true);
8a2b115580e8f7 Greg Joyce  2022-07-05  317  
8a2b115580e8f7 Greg Joyce  2022-07-05 @318  	if (IS_ERR(kref)) {
8a2b115580e8f7 Greg Joyce  2022-07-05 @319  		ret = PTR_ERR(kref);
8a2b115580e8f7 Greg Joyce  2022-07-05  320  	} else {
8a2b115580e8f7 Greg Joyce  2022-07-05  321  		key = key_ref_to_ptr(kref);
8a2b115580e8f7 Greg Joyce  2022-07-05 @322  		down_read(&key->sem);
8a2b115580e8f7 Greg Joyce  2022-07-05  323  		ret = key_validate(key);
8a2b115580e8f7 Greg Joyce  2022-07-05  324  		if (ret == 0) {
8a2b115580e8f7 Greg Joyce  2022-07-05  325  			if (buflen > key->datalen)
8a2b115580e8f7 Greg Joyce  2022-07-05  326  				buflen = key->datalen;
8a2b115580e8f7 Greg Joyce  2022-07-05  327  
8a2b115580e8f7 Greg Joyce  2022-07-05  328  			ret = key->type->read(key, (char *)buffer, buflen);
8a2b115580e8f7 Greg Joyce  2022-07-05  329  		}
8a2b115580e8f7 Greg Joyce  2022-07-05  330  		up_read(&key->sem);
8a2b115580e8f7 Greg Joyce  2022-07-05  331  
8a2b115580e8f7 Greg Joyce  2022-07-05  332  		key_ref_put(kref);
8a2b115580e8f7 Greg Joyce  2022-07-05  333  	}
8a2b115580e8f7 Greg Joyce  2022-07-05  334  
8a2b115580e8f7 Greg Joyce  2022-07-05  335  	return ret;
8a2b115580e8f7 Greg Joyce  2022-07-05  336  }
8a2b115580e8f7 Greg Joyce  2022-07-05  337  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
