//
//  UkeColorDefine.h
//  ZMUke
//
//  Created by DengFeng.Su on 2020/3/27.
//  Copyright © 2020 zmlearn. All rights reserved.
//

#ifndef UkeColorDefine_h
#define UkeColorDefine_h

#import "UkeColorAdaptor.h"

#ifndef UkeAdaptColor
    #define UkeAdaptColor(lightHex, darkHex) UkeColorHex(lightHex)
#endif

#ifndef UkeViewBackgroundColor
    #define UkeViewBackgroundColor UkeAdaptColor(0xFFFFFF, 0x1A1A1A)
#endif

#ifndef UkeCardBackgroundColor
    #define UkeCardBackgroundColor UkeAdaptColor(0xFFFFFF, 0x2B2B2B)
#endif

#ifndef UkeTitleColor
    #define UkeTitleColor UkeAdaptColor(0x333333, 0xEEEEEE)
#endif

#ifndef UkeCardTitleColor
    #define UkeCardTitleColor UkeAdaptColor(0x333333, 0xCCCCCC)
#endif

#ifndef UkeSubTitleColor
    #define UkeSubTitleColor UkeAdaptColor(0x666666, 0xCCCCCC)
#endif

#ifndef UkeCellSeparatorLineColor
    #define UkeCellSeparatorLineColor UkeAdaptColor(0xEEEEEE, 0x222222)
#endif

#ifndef UkeCardSeparatorLineColor
    #define UkeCardSeparatorLineColor UkeAdaptColor(0xF5F5F5, 0x333333)
#endif

#endif /* UkeColorDefine_h */
