/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_lstmap_bonus.c                                  :+:    :+:            */
/*                                                     +:+                    */
/*   By: rkieboom <rkieboom@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/29 07:25:53 by rkieboom       #+#    #+#                */
/*   Updated: 2019/11/29 08:43:28 by rkieboom      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list *new;

	while (lst->next != NULL)
	{
		new = f(lst);
		if (!new)
			del(new->content);
	}
	return (new);
}
