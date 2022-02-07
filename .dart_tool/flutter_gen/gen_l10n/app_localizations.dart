
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Twitter'**
  String get appName;

  /// No description provided for @abbreviationOfDay.
  ///
  /// In en, this message translates to:
  /// **'d'**
  String get abbreviationOfDay;

  /// No description provided for @abbreviationOfHour.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get abbreviationOfHour;

  /// No description provided for @abbreviationOfMinutes.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get abbreviationOfMinutes;

  /// No description provided for @abbreviationOfSeconds.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get abbreviationOfSeconds;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'january,february,march,april,may,june,july,august,september,october,november,december'**
  String get months;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'january'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'february'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'march'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'april'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'may'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'june'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'july'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'august'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'september'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'october'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'november'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'december'**
  String get december;

  /// No description provided for @drawerHeaderFollowing.
  ///
  /// In en, this message translates to:
  /// **' Following'**
  String get drawerHeaderFollowing;

  /// No description provided for @drawerHeaderFollowers.
  ///
  /// In en, this message translates to:
  /// **' Followers'**
  String get drawerHeaderFollowers;

  /// No description provided for @drawerScrollViewButtonTextProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get drawerScrollViewButtonTextProfile;

  /// No description provided for @drawerScrollViewButtonTextLists.
  ///
  /// In en, this message translates to:
  /// **'Lists'**
  String get drawerScrollViewButtonTextLists;

  /// No description provided for @drawerScrollViewButtonTextTopics.
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get drawerScrollViewButtonTextTopics;

  /// No description provided for @drawerScrollViewButtonTextBookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get drawerScrollViewButtonTextBookmarks;

  /// No description provided for @drawerScrollViewButtonTextMoments.
  ///
  /// In en, this message translates to:
  /// **'Moments'**
  String get drawerScrollViewButtonTextMoments;

  /// No description provided for @drawerScrollViewButtonTextMonetization.
  ///
  /// In en, this message translates to:
  /// **'Monetization'**
  String get drawerScrollViewButtonTextMonetization;

  /// No description provided for @drawerScrollViewButtonTextTwitterForProfessionals.
  ///
  /// In en, this message translates to:
  /// **'Twitter for Professionals'**
  String get drawerScrollViewButtonTextTwitterForProfessionals;

  /// No description provided for @drawerScrollViewButtonTextSettingsAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Settings and privacy'**
  String get drawerScrollViewButtonTextSettingsAndPrivacy;

  /// No description provided for @drawerScrollViewButtonTextHelpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get drawerScrollViewButtonTextHelpCenter;

  /// No description provided for @drawerBodyExpandedTextCreateANewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get drawerBodyExpandedTextCreateANewAccount;

  /// No description provided for @drawerTextAddanExistingAccount.
  ///
  /// In en, this message translates to:
  /// **'Add an existing account'**
  String get drawerTextAddanExistingAccount;

  /// No description provided for @retweetBottomSheetRetweet.
  ///
  /// In en, this message translates to:
  /// **'Retweet'**
  String get retweetBottomSheetRetweet;

  /// No description provided for @retweetBottomSheetQuoteTweet.
  ///
  /// In en, this message translates to:
  /// **'Quote Tweet'**
  String get retweetBottomSheetQuoteTweet;

  /// No description provided for @retweetBottomSheetUndoRetweet.
  ///
  /// In en, this message translates to:
  /// **'Undo Retweet'**
  String get retweetBottomSheetUndoRetweet;

  /// No description provided for @chatPageBodyUpperPartUserInfoFollowing.
  ///
  /// In en, this message translates to:
  /// **' Following'**
  String get chatPageBodyUpperPartUserInfoFollowing;

  /// No description provided for @chatPageBodyUpperPartUserInfoFollowers.
  ///
  /// In en, this message translates to:
  /// **' Followers'**
  String get chatPageBodyUpperPartUserInfoFollowers;

  /// No description provided for @chatPageBodyUpperParjoined.
  ///
  /// In en, this message translates to:
  /// **'joined'**
  String get chatPageBodyUpperParjoined;

  /// No description provided for @chatPageBottomBarSendTextHint.
  ///
  /// In en, this message translates to:
  /// **'Start a message'**
  String get chatPageBottomBarSendTextHint;

  /// No description provided for @chatPageInfoAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversation info'**
  String get chatPageInfoAppBarTitle;

  /// No description provided for @chatPageInfoBodyBlock.
  ///
  /// In en, this message translates to:
  /// **'Block: '**
  String get chatPageInfoBodyBlock;

  /// No description provided for @chatPageInfoBodyReport.
  ///
  /// In en, this message translates to:
  /// **'Report: '**
  String get chatPageInfoBodyReport;

  /// No description provided for @chatPageInfoBodyDeleteConversation.
  ///
  /// In en, this message translates to:
  /// **'Delete conversation'**
  String get chatPageInfoBodyDeleteConversation;

  /// No description provided for @chatPageInfoBodySnoozeNotifications.
  ///
  /// In en, this message translates to:
  /// **'Snooze notifications'**
  String get chatPageInfoBodySnoozeNotifications;

  /// No description provided for @chatPageInfoBodyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get chatPageInfoBodyNotifications;

  /// No description provided for @chatPageInfoBodyDeleteConversationAlertDialogTitleText.
  ///
  /// In en, this message translates to:
  /// **'Delete conversation'**
  String get chatPageInfoBodyDeleteConversationAlertDialogTitleText;

  /// No description provided for @chatPageInfoBodyDeleteConversationAlertDialogContentText.
  ///
  /// In en, this message translates to:
  /// **'This conversation will be deleted from your inbox. Other people in the conversation will still be able to see it.'**
  String get chatPageInfoBodyDeleteConversationAlertDialogContentText;

  /// No description provided for @chatPageInfoBodyDeleteConversationAlertDialogActionsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get chatPageInfoBodyDeleteConversationAlertDialogActionsCancel;

  /// No description provided for @chatPageInfoBodyDeleteConversationAlertDialogActionsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get chatPageInfoBodyDeleteConversationAlertDialogActionsDelete;

  /// No description provided for @messagePageAppbarSearchTittle.
  ///
  /// In en, this message translates to:
  /// **'Search for people and groups'**
  String get messagePageAppbarSearchTittle;

  /// No description provided for @messagePageSettingsAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get messagePageSettingsAppBarTitle;

  /// No description provided for @messagePageSettingsBodyItemClickableBlueText.
  ///
  /// In en, this message translates to:
  /// **' Learn more'**
  String get messagePageSettingsBodyItemClickableBlueText;

  /// No description provided for @messagePageSettingsBodyToggleAllowMessageTextTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow message requests from everyone'**
  String get messagePageSettingsBodyToggleAllowMessageTextTitle;

  /// No description provided for @messagePageSettingsBodyToggleAllowMessageText.
  ///
  /// In en, this message translates to:
  /// **'Let people who you don\'t follow send you message request and add you to group conversations. To reply to their messages, you need to accept the request.'**
  String get messagePageSettingsBodyToggleAllowMessageText;

  /// No description provided for @messagePageSettingsBodyShowReceiptsTextTitle.
  ///
  /// In en, this message translates to:
  /// **'Show read receipts'**
  String get messagePageSettingsBodyShowReceiptsTextTitle;

  /// No description provided for @messagePageSettingsBodyShowReceiptsText.
  ///
  /// In en, this message translates to:
  /// **'Let people you\'re messaging with know when you\'ve seen their messages. Read receipts are not shown on message requests.'**
  String get messagePageSettingsBodyShowReceiptsText;

  /// No description provided for @messagePageSettingsBodyFilterMessageTextTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter low-quality messages'**
  String get messagePageSettingsBodyFilterMessageTextTitle;

  /// No description provided for @messagePageSettingsBodyFilterMessageText.
  ///
  /// In en, this message translates to:
  /// **'Hide message requests that have been detected as being potentially spam or low-quality. These will be sent to a separate inbox at the bottom of your message requests. You can still access them if you want.'**
  String get messagePageSettingsBodyFilterMessageText;

  /// No description provided for @twitterSearchPageImageTopic.
  ///
  /// In en, this message translates to:
  /// **'Event·LIVE'**
  String get twitterSearchPageImageTopic;

  /// No description provided for @twitterSearchPageImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Updates on the COVID-19 situation in Turkey'**
  String get twitterSearchPageImageTitle;

  /// No description provided for @twitterSearchPageTrendsForYou.
  ///
  /// In en, this message translates to:
  /// **'Trends for you'**
  String get twitterSearchPageTrendsForYou;

  /// No description provided for @twitterSearchPageTrendWidgetHeader.
  ///
  /// In en, this message translates to:
  /// **'Trending in Turkey'**
  String get twitterSearchPageTrendWidgetHeader;

  /// No description provided for @twitterSearchPageTrendWidgetTweets.
  ///
  /// In en, this message translates to:
  /// **'Tweet'**
  String get twitterSearchPageTrendWidgetTweets;

  /// No description provided for @twitterSearchPageSearchScreenSearchForText.
  ///
  /// In en, this message translates to:
  /// **'Search for'**
  String get twitterSearchPageSearchScreenSearchForText;

  /// No description provided for @twitterSearchPageSearchScreenGoToText.
  ///
  /// In en, this message translates to:
  /// **'Go to @'**
  String get twitterSearchPageSearchScreenGoToText;

  /// No description provided for @twitterSearchPageSearchScreenBodySearchSomething.
  ///
  /// In en, this message translates to:
  /// **'Try searching for people, topics or keywords'**
  String get twitterSearchPageSearchScreenBodySearchSomething;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
