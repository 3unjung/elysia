import 'package:elysia/screen/dish/modal.dart';
import 'package:flutter/material.dart';

class CustomeImage extends StatefulWidget {
  final String image;

  const CustomeImage({Key? key, required this.image}) : super(key: key);

  @override
  State<CustomeImage> createState() => _CustomeImageState();
}

class _CustomeImageState extends State<CustomeImage> with SingleTickerProviderStateMixin{
  late ImageStream _imageStream;
  late ImageInfo _imageInfo;

  late ImageDetail _imageDetail;
  late ImageValuesNotifier _imageValueNotifier;

  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 700));

    _animation = Tween(begin: 600.0, end: 400.0 )
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _imageDetail = ImageDetail();
    _imageValueNotifier = ImageValuesNotifier(_imageDetail);

    _imageStream  = NetworkImage(
        widget.image + '?${DateTime.now().millisecondsSinceEpoch.toString()}').resolve(const ImageConfiguration());

    _imageStream.addListener(ImageStreamListener((info, value) {
      _imageInfo = info;
      _imageValueNotifier.changeLoadingState(true);

      _controller.forward();
      }, onChunk: (event){
      _imageDetail.expectedTotalBytes = event.expectedTotalBytes!;
      _imageValueNotifier.changeCumulativeBytesLoaded(event.cumulativeBytesLoaded);
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(valueListenable: _imageValueNotifier, builder: (context, ImageDetail value, child) {
      return Container(
        height: 400,
        width: 300,
        margin: EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: !value.isLoaded ? Center(
          child: CircularProgressIndicator(
            value: (value.cumulativeBytesLoaded / value.expectedTotalBytes) * 100.00,
          ),
        ) : Center(
          child: AnimatedBuilder(
            animation: _animation,
          builder: (context,child) {
            return OverflowBox(
              minHeight: 400.0,
              maxHeight: 600.0,
              minWidth: 300.0,
              maxWidth: 600.0,
              child: SizedBox(
                height: _animation.value,
                width: _animation.value - 100.00,
                child: child,
              ),
            );
          },
            child: RawImage(image: _imageInfo.image,),
        ),
        ),
      );
    });
    // return SizedBox(
    //   height: 300,
    //   child: Image.network('https://img.cuisineaz.com/660x660/2016/05/13/i71494-pizza-au-chorizo-poivron-et-tomate-a-ma-facon.jpg'),
    // );
  }
}
