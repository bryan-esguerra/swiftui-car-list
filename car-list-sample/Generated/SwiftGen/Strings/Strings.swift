// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
enum L10n {
    enum Banner {
        enum Title {
            /// Get your's now
            static let description = L10n.tr("Localizable", "banner.title.description", fallback: "Get your's now")
            /// Tacoma 2021
            static let label = L10n.tr("Localizable", "banner.title.label", fallback: "Tacoma 2021")
        }
    }

    enum Filters {
        enum Make {
            /// Any make
            static let label = L10n.tr("Localizable", "filters.make.label", fallback: "Any make")
        }

        enum Model {
            /// Any model
            static let label = L10n.tr("Localizable", "filters.model.label", fallback: "Any model")
        }

        enum Title {
            /// Filters
            static let label = L10n.tr("Localizable", "filters.title.label", fallback: "Filters")
        }
    }

    enum List {
        enum Cons {
            /// Cons :
            static let label = L10n.tr("Localizable", "list.cons.label", fallback: "Cons :")
        }

        enum Price {
            /// Price : %@
            static func label(_ p1: Any) -> String {
                return L10n.tr("Localizable", "list.price.label", String(describing: p1), fallback: "Price : %@")
            }
        }

        enum Pros {
            /// Pros :
            static let label = L10n.tr("Localizable", "list.pros.label", fallback: "Pros :")
        }
    }

    enum Nav {
        enum Title {
            /// GUIDOMIA
            static let label = L10n.tr("Localizable", "nav.title.label", fallback: "GUIDOMIA")
        }
    }
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
