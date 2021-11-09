part of app.home;

class CreatePostView extends StatefulWidget {
  static String route = "${HomeView.route}/create";

  _CreatePostViewState createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  TextEditingController content = TextEditingController();
  String? contentError;

  void validateContent(String _) {
    setState(() {
      contentError = content.text.isEmpty ? 'the content is required' : null;
    });
  }

  void launchCamera() async {}

  void launchGallery() async {}

  void onPressLoadPhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return bottomSheet();
      },
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 120,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select the post image',
              style: TextStyle(color: textColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  onPressed: launchCamera,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: launchGallery,
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('create_post_view'),
      appBar: AppBar(
        title: Text(
          "Create Post",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomNavbar(currentPage: MenuPage.none),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => onPressLoadPhoto(context),
                child: SizedBox(
                  height: 320,
                  width: SizeConfig.screenWidth,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: lightGrey,
                    ),
                    child: Icon(
                      Icons.photo_rounded,
                      color: textColor,
                      size: 48,
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              Input(
                controller: content,
                multiline: true,
                label: 'Post',
                placeholder: 'what are you thinking ?',
                onChange: validateContent,
                error: contentError,
              )
            ],
          ),
        ),
      ),
    );
  }
}
