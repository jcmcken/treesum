Name:           treesum
Version:        0.2.0
Release:        2%{?dist}
Group:          Utilities
Summary:        A command-line utility for calculating the checksum of a directory and its contents

License:        BSD  
Source0:        %{name}-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires:  make >= 3.81
BuildRequires:  coreutils
Requires:       bash
Requires:       findutils
Requires:       coreutils
BuildArch:      noarch

%description
A command-line utility for calculating the checksum of a directory and its
contents.

%prep
%setup -q

%install
[ -d $RPM_BUILD_ROOT ] && rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT

make DESTDIR=$RPM_BUILD_ROOT install

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(0644,root,root,0755)
%attr(0755,root,root) %{_bindir}/treesum
%{_datadir}/treesum/*
%doc README.rst
%doc LICENSE
%doc VERSION
%doc CHANGES

%changelog
* Fri Jan 22 2016 - Jon McKenzie - 0.2.0
- Bump to 0.2.0
* Wed Mar 27 2013 - Jon McKenzie - 0.1.0
- Initial implementation
