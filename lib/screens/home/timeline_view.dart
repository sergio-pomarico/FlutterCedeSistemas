part of app.home;

class TimelineView extends StatefulWidget {
  static String route = '${HomeView.route}';

  _TimelineViewState createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  @override
  void initState() {
    FeedBLoC feedBLoC = BlocProvider.of<FeedBLoC>(context);
    feedBLoC.add(LoadPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<FeedBLoC, FeedState>(
              builder: (BuildContext context, FeedState state) {
            return state.posts != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ...(state.posts ?? [])
                          .map((Post post) => PostCard(post: post))
                    ],
                  )
                : Center(
                    child: Text('No publications available'),
                  );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavbar(currentPage: MenuPage.home),
    );
  }
}
