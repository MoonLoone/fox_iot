
import 'package:fox_iot/local_storage/domain/models/FoxIoTUser.dart';

Map<String, dynamic> getUserDocument(FoxIoTUser user){
    return {
        "avatar_url": user.mainUserInfo.avatarUrl,
        "bio": user.mainUserInfo.bio,
        "firstname": user.mainUserInfo.name,
    };
}

