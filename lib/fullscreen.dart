import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreenn extends StatefulWidget {
  final String imageurl;
  const FullScreenn({super.key,required this.imageurl});

  @override
  State<FullScreenn> createState() => _FullScreennState();
}

class _FullScreennState extends State<FullScreenn> {

  Future<void>setWallpaper()async{
    int location = WallpaperManager.HOME_SCREEN;
    var file =await DefaultCacheManager().getSingleFile(widget.imageurl);
    String result = (await WallpaperManager.setWallpaperFromFile(file.path,location)) as String;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              child: Image.network(widget.imageurl),
            )),
            GestureDetector(
              onTap: () {
                setWallpaper();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Set Wallpaper",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
