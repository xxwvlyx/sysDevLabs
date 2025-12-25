Name:           etc-snapshot
Version:        1.0
Release:        1%{?dist}
Summary:        Snapshot of /etc files

License:        GPL
BuildArch:      noarch

Source0:        etc-snapshot-1.0.tar.gz

%description
This package contains files copied from /etc excluding directories and symlinks.

%prep
%setup -q -n etc-snapshot

%build
# nothing to build

%install
mkdir -p %{buildroot}/usr/share/etc-snapshot
cp -r * %{buildroot}/usr/share/etc-snapshot/

%files
/usr/share/etc-snapshot

%changelog
* Tue Dec 23 2025 Vladyslav <alwaysxjun@gmail.com> - 1.0-1
- Initial RPM package
