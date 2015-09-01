## Ramen Tacos
> CodePath iOS Training: Week 1

This is a movies app displaying box office and top rental DVDs using the [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON).

Time spent: `~10`

### Features

#### Required

- [x] User can view a list of movies. Poster images load asynchronously.
- [x] **PARTIAL** User can view movie details by tapping on a cell.
- [ ] User sees loading state while waiting for the API.
- [ ] User sees error message when there is a network error: http://cl.ly/image/1l1L3M460c3C
- [ ] User can pull to refresh the movie list.

#### Optional

- [x] All images fade in.
- [x] For the larger poster, load the low-res first and switch to high-res when complete.
- [x] All images should be cached in memory and disk: AppDelegate has an instance of `NSURLCache` and `NSURLRequest` makes a request with `NSURLRequestReturnCacheDataElseLoad` cache policy. I tested it by turning off wifi and restarting the app.
- [x] Customize the highlight and selection effect of the cell.
- [x] Customize the navigation bar.
- [ ] Add a tab bar for Box Office and DVD.
- [ ] Add a search bar: pretty simple implementation of searching against the existing table view data.

### Walkthrough
![ramen-tacos](https://cloud.githubusercontent.com/assets/810398/9598429/4e84403e-5040-11e5-922f-8b232e7f9f65.gif)

Credits
---------
* [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)