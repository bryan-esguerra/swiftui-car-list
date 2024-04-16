// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
    internal enum Banner {
        internal enum Title {
            /// Get your's now
            internal static let description = L10n.tr("Localizable", "banner.title.description", fallback: "Get your's now")
            /// TACOMA 2021
            internal static let label = L10n.tr("Localizable", "banner.title.label", fallback: "TACOMA 2021")
        }
    }

    internal enum Filters {
        internal enum Make {
            /// Any make
            internal static let label = L10n.tr("Localizable", "filters.make.label", fallback: "Any make")
        }

        internal enum Model {
            /// Any model
            internal static let label = L10n.tr("Localizable", "filters.model.label", fallback: "Any model")
        }

        internal enum Title {
            /// Filters
            internal static let label = L10n.tr("Localizable", "filters.title.label", fallback: "Filters")
        }
    }

    internal enum List {
        internal enum Cons {
            /// Cons :
            internal static let label = L10n.tr("Localizable", "list.cons.label", fallback: "Cons :")
        }

        internal enum Price {
            /// Price : %@
            internal static func label(_ p1: Any) -> String {
                return L10n.tr("Localizable", "list.price.label", String(describing: p1), fallback: "Price : %@")
            }
        }

        internal enum Pros {
            /// Pros :
            internal static let label = L10n.tr("Localizable", "list.pros.label", fallback: "Pros :")
        }
    }

    internal enum Nav {
        internal enum Title {
            /// GUIDOMIA
            internal static let label = L10n.tr("Localizable", "nav.title.label", fallback: "GUIDOMIA")
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
