
class ReduxState {

  List<Tweet> timelines() {
    return [
      Tweet(senderName: 'haha', avatarURL: 'https://img3.doubanio.com/icon/ul2771112-56.jpg', text: 'this a tweet', images: ['https://cdn.shopify.com/s/files/1/2517/3238/files/pretty-3_700x.jpg?v=1509833204']),
      Tweet(senderName: 'kaka', avatarURL: 'https://img3.doubanio.com/icon/ul2771112-56.jpg', text: 'this a tweet'),
      Tweet(senderName: 'jaja', avatarURL: 'https://img3.doubanio.com/icon/ul2771112-56.jpg', text: 'this is a very loooooooooong tweet with multiple lines \n\n\n is it rendered correctly??')
    ];
  }
}
// https://cdn.shopify.com/s/files/1/2517/3238/files/pretty-3_700x.jpg?v=1509833204
class Tweet {
  final String senderName;
  final String avatarURL;
  final String text;
  final List<String> images;
  final Tweet reference;
  
  Tweet({this.senderName, this.avatarURL, this.text, this.images, this.reference});

  bool hasImages() {
    if (this.images == null) {
      return false;
    }

    return this.images.isNotEmpty;
  }
}